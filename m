Return-Path: <linux-usb+bounces-10987-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C508FF119
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2024 17:47:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5294B1F279ED
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2024 15:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243D8198831;
	Thu,  6 Jun 2024 15:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=siemens.com header.i=diogo.ivo@siemens.com header.b="lsUYfAPW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B690C197A99
	for <linux-usb@vger.kernel.org>; Thu,  6 Jun 2024 15:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717688835; cv=none; b=rBF+WhwIUq/yrY2N4JQWdirYz453Jyb2pzLk3LJC7x0f3UxmBWxBUJqInoRms2vVQ0CgkTk6qh05MTcCuGTO6OzT2nMvN8IcFOAncx6hEl7FFCUH7DK6wULUu3cz/xA6p+W6gP6/qBnXeT4juWcgyuWyB9Q73e1fQftx3NZN9Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717688835; c=relaxed/simple;
	bh=vrTXVPJSfCdHgRlQve8QZixtZSx5LZeM/+2U7ngm2Hk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T3QLjSMYF84EcZGC9chriZhvCwSeoFOoKSWDv6DT/6cU1FEutwIj+xQ4kj6ONY4mWPownO07MeiNdlXKDJ1SQa66Q+IzJ/L86amRGOjNMudajBcxlTVqqQdaCnNpOARpPYx56UYhfJE4zVXlNy28O389ukiavN5TdWT4n10o47g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (1024-bit key) header.d=siemens.com header.i=diogo.ivo@siemens.com header.b=lsUYfAPW; arc=none smtp.client-ip=185.136.65.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2024060615470558f38056c349d2034a
        for <linux-usb@vger.kernel.org>;
        Thu, 06 Jun 2024 17:47:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=diogo.ivo@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=MttvI1OKyaN+SBY2+k/1ktddeHssJ6lmI4v9SdChLC0=;
 b=lsUYfAPWDB4NfBDbUQHnP3B0Irm1FG2hJ4NkPfiW2356Kl+PKiLCgSo9Fmq/Zj0sSJgP7w
 EbzAHYzKaXAWz2ScD6+3Uc+DyDDpRtMNVoj7O35SNaz5ehZMGvS364tB54gxJ2E+2A9yF1H4
 5Grt4xxHS7jhIS3VD9EJ/OVILg4Rs=;
Message-ID: <a11a3cf2-5e25-471f-ad74-4834d3540e1d@siemens.com>
Date: Thu, 6 Jun 2024 16:47:04 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] usb: typec: ucsi: treat get_pdos not supported condition
 as info instead of error
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <mpearson-lenovo@squebb.ca>
 <20240604194056.16625-1-mpearson-lenovo@squebb.ca>
 <2midmmssv2i3plvtc2hajar6alfvggpnbvgpmldspelxsnjvcl@qiblhwat6n3p>
 <a517bb13-9772-49f9-b75c-8fa4d98b2ae9@app.fastmail.com>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@siemens.com>
In-Reply-To: <a517bb13-9772-49f9-b75c-8fa4d98b2ae9@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1320519:519-21489:flowmailer

Hi Mark,

On 6/5/24 6:09 PM, Mark Pearson wrote:
> 
> @@ -645,9 +645,13 @@ static int ucsi_read_pdos(struct ucsi_connector *con,
>   static int ucsi_get_pdos(struct ucsi_connector *con, enum typec_role role,
>                           int is_partner, u32 *pdos)
>   {
> +       struct ucsi *ucsi = con->ucsi;
>          u8 num_pdos;
>          int ret;
>   
> +       if (!(ucsi->cap.features & UCSI_CAP_PDO_DETAILS))
> +               return 0;
> +
>          /* UCSI max payload means only getting at most 4 PDOs at a time */
>          ret = ucsi_read_pdos(con, role, is_partner, pdos, 0, UCSI_MAX_PDOS);
> 

Seems good to me too.

Best regards,
Diogo

