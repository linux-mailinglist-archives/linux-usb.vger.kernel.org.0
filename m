Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1A8B160EEF
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2020 10:39:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728938AbgBQJil (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Feb 2020 04:38:41 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55574 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728851AbgBQJik (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Feb 2020 04:38:40 -0500
Received: by mail-wm1-f68.google.com with SMTP id q9so16388370wmj.5
        for <linux-usb@vger.kernel.org>; Mon, 17 Feb 2020 01:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=4AsGTG/OFqO6qsH2KYmK7GASPCv79EpZJ4jhiCYJIes=;
        b=lfJcxepI3jQXzbLtCtY9HSPFOBd8P1Vfv8qUNmo31a56UCSBWzvJvrJcL1zpDxgz60
         tfwBhAg81voEDzXTwUfg/yu4oAQ4KCi3AkZwyJBwi+ELaig2l1nDwF5wuEht/re//aPc
         6nxASaqN7Xi4+1YMBlMqgHn86jh99DgOCBYlw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=4AsGTG/OFqO6qsH2KYmK7GASPCv79EpZJ4jhiCYJIes=;
        b=po9shDWQwZfBVaG4OzEyd3xX6/WzyYKLpF1db6FWmtar90vPWe1SE18lK42z+4bcja
         TyjVkEGEc+rv2+ZftUAhKP4AyRtPwF+T9/ZvCWVkzjLyouc/stbidmhZXP4LQy47WbM5
         6CZn06l8+5E6Ynz6qBa+BZBX8R7XJolmKLKNUOrwUEPMeF/4rqOTSb5u0hBPcQYpRecV
         MXReOYRU/8QJh3HCeWfdGTF4sBvkEm1EHYXuO+MFxkK6uNmQ9MOkPuBNy5R2nB0cFhHY
         QF7OnjHbpE1sHm9o67oRsiKyTCxrID3B+/n4HpfQyeECYZPgvlvhDPJChQUHu4L/kDtu
         0mYA==
X-Gm-Message-State: APjAAAVeHxr8Nok2GHxPvji8L9N4FBT1cetQcg8ilGBKiwN3qYn0M3Ck
        fpl5xGNlayu8PDMRUo/CyBNkjg==
X-Google-Smtp-Source: APXvYqzz9RGCdLXybysIOwhORK42HEzXZghtcwQsttBDAJWRzoPn7H08JUft2XzRnu4w6jND78x4Xw==
X-Received: by 2002:a7b:c750:: with SMTP id w16mr20794205wmk.46.1581932319380;
        Mon, 17 Feb 2020 01:38:39 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id f1sm89018wro.85.2020.02.17.01.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 01:38:38 -0800 (PST)
Date:   Mon, 17 Feb 2020 10:38:36 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc:     broonie@kernel.org, balbi@kernel.org, lee.jones@linaro.org,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [RFC 8/9] drm/client: Add drm_client_init_from_id() and
 drm_client_modeset_set()
Message-ID: <20200217093836.GH2363188@phenom.ffwll.local>
References: <20200216172117.49832-1-noralf@tronnes.org>
 <20200216172117.49832-9-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200216172117.49832-9-noralf@tronnes.org>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Feb 16, 2020 at 06:21:16PM +0100, Noralf Trønnes wrote:
> drm_client_init_from_id() provides a way for clients to add a client based
> on the minor. drm_client_modeset_set() provides a way to set the modeset
> for clients that handles connectors and display mode on their own.
> 
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---
>  drivers/gpu/drm/drm_client.c         | 37 ++++++++++++++++++++
>  drivers/gpu/drm/drm_client_modeset.c | 52 ++++++++++++++++++++++++++++
>  include/drm/drm_client.h             |  4 +++
>  3 files changed, 93 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index d9a2e3695525..dbd73fe8d987 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -112,6 +112,43 @@ int drm_client_init(struct drm_device *dev, struct drm_client_dev *client,
>  }
>  EXPORT_SYMBOL(drm_client_init);
>  
> +/**
> + * drm_client_init_from_id - Initialise a DRM client
> + * @minor_id: DRM minor id
> + * @client: DRM client
> + * @name: Client name
> + * @funcs: DRM client functions (optional)
> + *
> + * This function looks up the drm_device using the minor id and initializes the client.
> + * It also registeres the client to avoid a possible race with DRM device unregister.

I think another sentence here would be good, explaining that this is for
drivers outside of drm to expose a specific drm driver in some fashion,
and just outright mention your use-case as an example.

I'm also not sure whether lookup-by-minor is the greatest thing for
kernel-internal lookups like this, maybe Greg has some idea?

> + *
> + * See drm_client_init() and drm_client_register().
> + *
> + * Returns:
> + * Zero on success or negative error code on failure.
> + */
> +int drm_client_init_from_id(unsigned int minor_id, struct drm_client_dev *client,
> +			    const char *name, const struct drm_client_funcs *funcs)
> +{
> +	struct drm_minor *minor;
> +	int ret;
> +
> +	minor = drm_minor_acquire(minor_id);
> +	if (IS_ERR(minor))
> +		return PTR_ERR(minor);
> +
> +	mutex_lock(&minor->dev->clientlist_mutex);
> +	ret = drm_client_init(minor->dev, client, name, funcs);
> +	if (!ret)
> +		list_add(&client->list, &minor->dev->clientlist);
> +	mutex_unlock(&minor->dev->clientlist_mutex);
> +
> +	drm_minor_release(minor);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_client_init_from_id);
> +
>  /**
>   * drm_client_register - Register client
>   * @client: DRM client
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> index 895b73f23079..9396267e646c 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -807,6 +807,58 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
>  }
>  EXPORT_SYMBOL(drm_client_modeset_probe);
>  
> +/**
> + * drm_client_modeset_set() - Set modeset
> + * @client: DRM client
> + * @connector: Connector
> + * @mode: Display mode
> + * @fb: Framebuffer
> + *
> + * This function releases any current modeset info and sets the new modeset in
> + * the client's modeset array.
> + *
> + * Returns:
> + * Zero on success or negative error code on failure.
> + */
> +int drm_client_modeset_set(struct drm_client_dev *client, struct drm_connector *connector,
> +			   struct drm_display_mode *mode, struct drm_framebuffer *fb)

Hm, since you need the functionality would be kinda neat to wire this up
for the fbdev emulation too. Ofc without reallocating the framebuffer
(fbdev can't do that), so would be limited to lower resolutions than we
booted with.
-Daniel

> +{
> +	struct drm_mode_set *modeset;
> +	int ret = -ENOENT;
> +
> +	mutex_lock(&client->modeset_mutex);
> +
> +	drm_client_modeset_release(client);
> +
> +	if (!connector || !mode || !fb) {
> +		ret = 0;
> +		goto unlock;
> +	}
> +
> +	drm_client_for_each_modeset(modeset, client) {
> +		if (!connector_has_possible_crtc(connector, modeset->crtc))
> +			continue;
> +
> +		modeset->mode = drm_mode_duplicate(client->dev, mode);
> +		if (!modeset->mode) {
> +			ret = -ENOMEM;
> +			break;
> +		}
> +
> +		drm_connector_get(connector);
> +		modeset->connectors[modeset->num_connectors++] = connector;
> +
> +		modeset->fb = fb;
> +		ret = 0;
> +		break;
> +	}
> +unlock:
> +	mutex_unlock(&client->modeset_mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_client_modeset_set);
> +
>  /**
>   * drm_client_rotation() - Check the initial rotation value
>   * @modeset: DRM modeset
> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> index 5cf2c5dd8b1e..97e4157d07c5 100644
> --- a/include/drm/drm_client.h
> +++ b/include/drm/drm_client.h
> @@ -104,6 +104,8 @@ struct drm_client_dev {
>  
>  int drm_client_init(struct drm_device *dev, struct drm_client_dev *client,
>  		    const char *name, const struct drm_client_funcs *funcs);
> +int drm_client_init_from_id(unsigned int minor_id, struct drm_client_dev *client,
> +			    const char *name, const struct drm_client_funcs *funcs);
>  void drm_client_release(struct drm_client_dev *client);
>  void drm_client_register(struct drm_client_dev *client);
>  
> @@ -155,6 +157,8 @@ void drm_client_buffer_vunmap(struct drm_client_buffer *buffer);
>  int drm_client_modeset_create(struct drm_client_dev *client);
>  void drm_client_modeset_free(struct drm_client_dev *client);
>  int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width, unsigned int height);
> +int drm_client_modeset_set(struct drm_client_dev *client, struct drm_connector *connector,
> +			   struct drm_display_mode *mode, struct drm_framebuffer *fb);
>  bool drm_client_rotation(struct drm_mode_set *modeset, unsigned int *rotation);
>  int drm_client_modeset_commit_force(struct drm_client_dev *client);
>  int drm_client_modeset_commit(struct drm_client_dev *client);
> -- 
> 2.23.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
