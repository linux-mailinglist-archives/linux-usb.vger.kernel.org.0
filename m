Return-Path: <linux-usb+bounces-38138-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJhEGs5oGGrcjggAu9opvQ
	(envelope-from <linux-usb+bounces-38138-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 18:09:50 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD7D5F4C8E
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 18:09:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CDC932090A4
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2026 16:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D980405C5F;
	Thu, 28 May 2026 15:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="R0mlm6TV"
X-Original-To: linux-usb@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC4B3F4DE6;
	Thu, 28 May 2026 15:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779983231; cv=pass; b=eCn5M+VLtAOYy8ZkPcHYCCfTM98DmUCLNRyjAQCFOFd9OhHrZCIxIAZmouXdSsmMY89gnAO6IUJUrJagx8TuL117K691ONa8eZBO8ZJre4ZMdOveHcVx8QkzUkwFUB/yPjxa0lJBltRZeR2oK2PJtI7w9+AtpdOZKzHibBQKQko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779983231; c=relaxed/simple;
	bh=YrIFYnNwK75hqr+l1VVedPTBsTSrKgJulBagzMf3kdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iA3A1YTZ5tMG5P/xkiEGCH4fhtrj8jcm59uY8eEeRu5+TuyzznppNzZppa9/DVmcrQxG9Z12kn+Ayuxr64KlXCf2X5VUf/oUGpQCF1scDnOO5ArMlzOsqYMVNLJSG+3ITTfynglswKMjp3mnK8Lsy1CG4hmxVvDltcPuvD3jRAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=R0mlm6TV; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1779983187; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GHWMHdoWNcU15l0hvRveP46RyYdqPgCNIeJOJbgJI9JBobYiofMCMQDP9tkyRw47bS6196r8P9gujSO6cNJ9Ac5kv/bPGASHU7fkljblkRp5xGqhzxVFEPJvBplRIblIb4HnGhMU1zkIXRKyOlTy8syLsNSciYqlZYJrNnrZGdg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779983187; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TdX9/bZga6Qg6ao7lAnopeSLFZmhgNqsCFRMGQo40M0=; 
	b=hnRAzfqXviyjhZIjxpBSmwxqGkCfShiXtPnNYqedxGvcMfnf2fvfm9L00qulOPvmRbankDXGxKrmhNds05DPIqHJVOPhitigUxdoObfdeZRi2AXap80Tcxqq4s4Jgja7nsUTW8KIao9gayS/yaqATsbLz2nRRej1dIwvOkRhUcc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779983187;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=TdX9/bZga6Qg6ao7lAnopeSLFZmhgNqsCFRMGQo40M0=;
	b=R0mlm6TVO+9eUKq9MnKnKU3dLEa/hEkLVmVw68chR+YqDd8tvgRJEpMlFBM5I/5b
	c6+TcHKMz7YIBp1eqtoYItnX8cbubTExtEOZ+GY+weuPi7GZAMLommCqfp7gb4Fd1hy
	09jBTk09vbl4tp4nh1BvU45oHlAvHghEBJXyExbE=
Received: by mx.zohomail.com with SMTPS id 1779983186292414.93444418879574;
	Thu, 28 May 2026 08:46:26 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, Hugh Cole-Baker <sigmaris@gmail.com>,
 dri-devel@lists.freedesktop.org, Chaoyi Chen <kernel@airkyi.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject:
 Re: [PATCH v15 2/9] drm/bridge: aux: Add drm_aux_bridge_register_from_node()
Date: Thu, 28 May 2026 17:46:15 +0200
Message-ID: <zQEH3WYtRMCn07SWaZMzgQ@collabora.com>
In-Reply-To: <20260304094152.92-3-kernel@airkyi.com>
References:
 <20260304094152.92-1-kernel@airkyi.com>
 <20260304094152.92-3-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	CTE_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38138-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,linuxfoundation.org,oss.qualcomm.com,gmail.com,bootlin.com,kernel.org,sntech.de,rock-chips.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,suse.de,ffwll.ch,google.com,manjaro.org,cknow.org,lists.freedesktop.org,airkyi.com];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,collabora.com:email,collabora.com:mid,collabora.com:dkim,linaro.org:email]
X-Rspamd-Queue-Id: BDD7D5F4C8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wednesday, 4 March 2026 10:41:45 Central European Summer Time Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> The drm_aux_bridge_register() uses the device->of_node as the
> bridge->of_node.
> 
> This patch adds drm_aux_bridge_register_from_node() to allow
> specifying the of_node corresponding to the bridge.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> 
> (no changes since v11)
> ---
> 
>  drivers/gpu/drm/bridge/aux-bridge.c | 24 ++++++++++++++++++++++--
>  include/drm/bridge/aux-bridge.h     |  6 ++++++
>  2 files changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/aux-bridge.c b/drivers/gpu/drm/bridge/aux-bridge.c
> index b3e4cdff61d6..52dff4601c2d 100644
> --- a/drivers/gpu/drm/bridge/aux-bridge.c
> +++ b/drivers/gpu/drm/bridge/aux-bridge.c
> @@ -35,6 +35,7 @@ static void drm_aux_bridge_unregister_adev(void *_adev)
>  /**
>   * drm_aux_bridge_register - Create a simple bridge device to link the chain

Function name needs to be changed here as well. You can validate
kernel doc strings for a single file with:

  ./tools/docs/kernel-doc -v -none drivers/gpu/drm/bridge/aux-bridge.c

With that fixed:

Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Kind regards,
Nicolas Frattaroli

>   * @parent: device instance providing this bridge
> + * @np: device node pointer corresponding to this bridge instance
>   *
>   * Creates a simple DRM bridge that doesn't implement any drm_bridge
>   * operations. Such bridges merely fill a place in the bridge chain linking
> @@ -42,7 +43,7 @@ static void drm_aux_bridge_unregister_adev(void *_adev)
>   *
>   * Return: zero on success, negative error code on failure
>   */
> -int drm_aux_bridge_register(struct device *parent)
> +int drm_aux_bridge_register_from_node(struct device *parent, struct device_node *np)
>  {
>  	struct auxiliary_device *adev;
>  	int ret;
> @@ -62,7 +63,10 @@ int drm_aux_bridge_register(struct device *parent)
>  	adev->dev.parent = parent;
>  	adev->dev.release = drm_aux_bridge_release;
>  
> -	device_set_of_node_from_dev(&adev->dev, parent);
> +	if (np)
> +		device_set_node(&adev->dev, of_fwnode_handle(np));
> +	else
> +		device_set_of_node_from_dev(&adev->dev, parent);
>  
>  	ret = auxiliary_device_init(adev);
>  	if (ret) {
> @@ -80,6 +84,22 @@ int drm_aux_bridge_register(struct device *parent)
>  
>  	return devm_add_action_or_reset(parent, drm_aux_bridge_unregister_adev, adev);
>  }
> +EXPORT_SYMBOL_GPL(drm_aux_bridge_register_from_node);
> +
> +/**
> + * drm_aux_bridge_register - Create a simple bridge device to link the chain
> + * @parent: device instance providing this bridge
> + *
> + * Creates a simple DRM bridge that doesn't implement any drm_bridge
> + * operations. Such bridges merely fill a place in the bridge chain linking
> + * surrounding DRM bridges.
> + *
> + * Return: zero on success, negative error code on failure
> + */
> +int drm_aux_bridge_register(struct device *parent)
> +{
> +	return drm_aux_bridge_register_from_node(parent, NULL);
> +}
>  EXPORT_SYMBOL_GPL(drm_aux_bridge_register);
>  
>  struct drm_aux_bridge_data {
> diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
> index c2f5a855512f..7dd1f17a1354 100644
> --- a/include/drm/bridge/aux-bridge.h
> +++ b/include/drm/bridge/aux-bridge.h
> @@ -13,11 +13,17 @@ struct auxiliary_device;
>  
>  #if IS_ENABLED(CONFIG_DRM_AUX_BRIDGE)
>  int drm_aux_bridge_register(struct device *parent);
> +int drm_aux_bridge_register_from_node(struct device *parent, struct device_node *np);
>  #else
>  static inline int drm_aux_bridge_register(struct device *parent)
>  {
>  	return 0;
>  }
> +
> +static inline int drm_aux_bridge_register_from_node(struct device *parent, struct device_node *np)
> +{
> +	return 0;
> +}
>  #endif
>  
>  #if IS_ENABLED(CONFIG_DRM_AUX_HPD_BRIDGE)
> 





