<?php
/**
 * The default template for displaying content. Used for both single and index/archive/search.
 *
 * @package WordPress
 * @subpackage Twenty_Twelve
 * @since Twenty Twelve 1.0
 */
?>

	<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
		<?php if ( is_sticky() && is_home() && ! is_paged() ) : ?>
		<div class="featured-post">
			<?php _e( 'Featured post', 'twentytwelve' ); ?>
		</div>
		<?php endif; ?>
		<header class="entry-header">
			<?php the_post_thumbnail(); ?>
			<?php if ( is_single() ) : ?>
			<h1 class="entry-title"><?php the_title(); ?></h1>
			<?php else : ?>
			<h1 class="entry-title">
				<a href="<?php the_permalink(); ?>" title="<?php echo esc_attr( sprintf( __( 'Permalink to %s', 'twentytwelve' ), the_title_attribute( 'echo=0' ) ) ); ?>" rel="bookmark"><?php the_title(); ?></a>
			</h1>
			<?php endif; // is_single() ?>
			<?php if ( comments_open() ) : ?>
				<div class="comments-link">
					<?php comments_popup_link( '<span class="leave-reply">' . __( 'Leave a reply', 'twentytwelve' ) . '</span>', __( '1 Reply', 'twentytwelve' ), __( '% Replies', 'twentytwelve' ) ); ?>
				</div><!-- .comments-link -->
			<?php endif; // comments_open() ?>
		</header><!-- .entry-header -->

		<div class="champs-persos">
			<?php
			$realisateur = get_post_meta($post->ID, 'Réalisateur', true);
			$acteurs = get_post_meta($post->ID, 'Interprètes', true);
			$duree = get_post_meta($post->ID, 'Durée', true);
			$pays = get_post_meta($post->ID, 'Pays', true);
			$annee = get_post_meta($post->ID, 'Année', true);
			$version = get_post_meta($post->ID, 'Version', true);
			?>
			<?php if(false === empty($realisateur)): ?>
			<p>
			<span class="champs-persos-item">
			<i class=”champs-persos-label”>réalisateur(s) : </i>
			<?php echo $realisateur ?></span>
			</p>
			<?php endif; ?>
			<?php if(false === empty($acteurs)): ?>
			<p>
			<span class="champs-persos-item">
			<i class=”champs-persos-label”>interprètes : </i>
			<?php echo $acteurs ?></span>
			</p>
			<?php endif; ?>
			<?php if(false === empty($annee)): ?>
			<p>
			<span class="champs-persos-item">
			<i class=”champs-persos-label”>année : </i>
			<?php echo $annee ?></span>
			</p>
			<?php endif; ?>
			<?php if(false === empty($duree)): ?>
			<p>
			<span class="champs-persos-item">
			<i class=”champs-persos-label”>durée : </i>
			<?php echo $duree ?></span>
			</p>
			<?php endif; ?>
			<?php if(false === empty($pays)): ?>
			<p>
			<span class="champs-persos-item">
			<i class=”champs-persos-label”>pays : </i>
			<?php echo $pays ?></span>
			</p>
			<?php endif; ?>
			<?php if(false === empty($version)): ?>
			<p>
			<span class="champs-persos-item">
			<i class=”champs-persos-label”>Version : </i>
			<?php echo $version ?></span>
			</p>
			<?php endif; ?>
		</div> <!-- .champs-perso -->		

		<?php if ( is_search() ) : // Only display Excerpts for Search ?>
		<div class="entry-summary">
			<?php the_excerpt(); ?>
		</div><!-- .entry-summary -->
		<?php else : ?>
		<div class="entry-content">
			<?php the_content( __( 'Continue reading <span class="meta-nav">&rarr;</span>', 'twentytwelve' ) ); ?>
			<?php wp_link_pages( array( 'before' => '<div class="page-links">' . __( 'Pages:', 'twentytwelve' ), 'after' => '</div>' ) ); ?>
		</div><!-- .entry-content -->
		<?php endif; ?>

		


		<footer class="entry-meta">
			
		</footer><!-- .entry-meta -->
	</article><!-- #post -->
