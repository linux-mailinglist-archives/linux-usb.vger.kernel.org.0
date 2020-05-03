Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1875E1C2AB0
	for <lists+linux-usb@lfdr.de>; Sun,  3 May 2020 10:03:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727797AbgECIDe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 3 May 2020 04:03:34 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:38812 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726884AbgECIDe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 3 May 2020 04:03:34 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id A82AC804D8;
        Sun,  3 May 2020 10:03:31 +0200 (CEST)
Date:   Sun, 3 May 2020 10:03:30 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc:     dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 05/10] drm/client: Add drm_client_modeset_check()
Message-ID: <20200503080330.GC11582@ravnborg.org>
References: <20200429124830.27475-1-noralf@tronnes.org>
 <20200429124830.27475-6-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200429124830.27475-6-noralf@tronnes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=8nJEP1OIZ-IA:10 a=SJz97ENfAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
        a=PZriz1ZvORYytxt_Md8A:9 a=wPNLvfGTeEIA:10 a=vFet0B0WnEQeilDPIY6i:22
        a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
        a=pHzHmUro8NiASowvMSCR:22 a=6VlIyEUom7LUIeUMNQJH:22
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Noralf.

On Wed, Apr 29, 2020 at 02:48:25PM +0200, Noralf Trønnes wrote:
> Add a way for client to check the configuration before comitting.
> 
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
Two small ntis. With these addressed:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/drm_client_modeset.c | 35 ++++++++++++++++++++++++----
>  include/drm/drm_client.h             |  1 +
>  2 files changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> index 7443114bd713..177158ff2a40 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -966,7 +966,7 @@ bool drm_client_rotation(struct drm_mode_set *modeset, unsigned int *rotation)
>  }
>  EXPORT_SYMBOL(drm_client_rotation);
>  
> -static int drm_client_modeset_commit_atomic(struct drm_client_dev *client, bool active)
> +static int drm_client_modeset_commit_atomic(struct drm_client_dev *client, bool active, bool check)
>  {
>  	struct drm_device *dev = client->dev;
>  	struct drm_plane *plane;
> @@ -1033,7 +1033,10 @@ static int drm_client_modeset_commit_atomic(struct drm_client_dev *client, bool
>  		}
>  	}
>  
> -	ret = drm_atomic_commit(state);
> +	if (check)
> +		ret = drm_atomic_check_only(state);
> +	else
> +		ret = drm_atomic_commit(state);
>  
>  out_state:
>  	if (ret == -EDEADLK)
> @@ -1094,6 +1097,30 @@ static int drm_client_modeset_commit_legacy(struct drm_client_dev *client)
>  	return ret;
>  }
>  
> +/**
> + * drm_client_modeset_check() - Check CRTC configuration
This part of the comment does not match the description below.


> + * @client: DRM client
> + *
> + * Check modeset configuration.
> + *
> + * Returns:
> + * Zero on success or negative error code on failure.
> + */
> +int drm_client_modeset_check(struct drm_client_dev *client)
> +{
> +	int ret;
> +
> +	if (!drm_drv_uses_atomic_modeset(client->dev))
> +		return 0;
If client does not use atomic the check should fail - no?

> +
> +	mutex_lock(&client->modeset_mutex);
> +	ret = drm_client_modeset_commit_atomic(client, true, true);
> +	mutex_unlock(&client->modeset_mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_client_modeset_check);
> +
>  /**
>   * drm_client_modeset_commit_locked() - Force commit CRTC configuration
>   * @client: DRM client
> @@ -1112,7 +1139,7 @@ int drm_client_modeset_commit_locked(struct drm_client_dev *client)
>  
>  	mutex_lock(&client->modeset_mutex);
>  	if (drm_drv_uses_atomic_modeset(dev))
> -		ret = drm_client_modeset_commit_atomic(client, true);
> +		ret = drm_client_modeset_commit_atomic(client, true, false);
>  	else
>  		ret = drm_client_modeset_commit_legacy(client);
>  	mutex_unlock(&client->modeset_mutex);
> @@ -1188,7 +1215,7 @@ int drm_client_modeset_dpms(struct drm_client_dev *client, int mode)
>  
>  	mutex_lock(&client->modeset_mutex);
>  	if (drm_drv_uses_atomic_modeset(dev))
> -		ret = drm_client_modeset_commit_atomic(client, mode == DRM_MODE_DPMS_ON);
> +		ret = drm_client_modeset_commit_atomic(client, mode == DRM_MODE_DPMS_ON, false);
>  	else
>  		drm_client_modeset_dpms_legacy(client, mode);
>  	mutex_unlock(&client->modeset_mutex);
> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
> index 6ef5364d6dfb..b6ffa4863e45 100644
> --- a/include/drm/drm_client.h
> +++ b/include/drm/drm_client.h
> @@ -164,6 +164,7 @@ int drm_client_modeset_create(struct drm_client_dev *client);
>  void drm_client_modeset_free(struct drm_client_dev *client);
>  int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width, unsigned int height);
>  bool drm_client_rotation(struct drm_mode_set *modeset, unsigned int *rotation);
> +int drm_client_modeset_check(struct drm_client_dev *client);
>  int drm_client_modeset_commit_locked(struct drm_client_dev *client);
>  int drm_client_modeset_commit(struct drm_client_dev *client);
>  int drm_client_modeset_dpms(struct drm_client_dev *client, int mode);
> -- 
> 2.23.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
