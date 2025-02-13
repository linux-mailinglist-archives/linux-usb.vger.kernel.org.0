Return-Path: <linux-usb+bounces-20619-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BE7A34811
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2025 16:43:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F3F83AC9D3
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2025 15:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99AD13C816;
	Thu, 13 Feb 2025 15:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="PJwAxXxh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE93418858A
	for <linux-usb@vger.kernel.org>; Thu, 13 Feb 2025 15:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739460614; cv=none; b=VYtjpYLnajhC7jccY+bUsYLW7kP/I79RvnBjiIYxTGbmBpSUTCog328SnoelSRZukhUq2AjEJHjjbl0bJvBT9IF0ZiAJTQoCt1ujHt23l9Hy5cyoWQN5QQNwcnCqw8KYrL85FOh7n85wGE1QUzWh6Cu6JwGhrBK7gDh5NBOH3wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739460614; c=relaxed/simple;
	bh=CIC6QG19MUkOFnBkVOTHWWc79rnkVCbOB9b7kdnsa6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ex6UmCRwEt9Ryy7z++QF6RcvNRJBykRIkNGc/SelkJNIMbxQa/t0WnPM7SMPc2ZvLDN9OvbIpQU3Kmzot36iJxj9aJ0Z82S/SXpH4vSJMf5VJgO3Bf2MXcH5g1cwSjX2DD+jCwvhA5dEPkaQ5gFXU7BtT0xxINaz5VVFs8REiNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=PJwAxXxh; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c0818add57so10508385a.3
        for <linux-usb@vger.kernel.org>; Thu, 13 Feb 2025 07:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1739460611; x=1740065411; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OyIrs9HvFfKVmUwHZOR1GwKDKzsItdw/GMVirRewx9o=;
        b=PJwAxXxh4usPSlREw4QudQf5pFPmqnObjxOjpxl/KBVmxss1vyDixPqOdSIsftlBTn
         ye/0RV4tYBwPKz8/cXw7pLokhRtBDSMpviZUfUaGecKJUurah4BcWxo7GIalUaPQs6s/
         368uzE35qHQ1bcD6MFynK3LYiIrv9Fhc3orAhELMNd+5hyEtd4f6REiiulJXZaZpGL1X
         qPI8Duqa8MXpthjmjr2+nzyOD1MqNNxGhKKE5BjuwJqgxHdbQs0iKhFAy0Im2rAfyoE0
         KWZ5u1wnIdSxLlLUTyNu80LrY0Zol2Ze4yAA5r0jW8UJHl6RVQYVI++g4LgM4exBfVMv
         v2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739460611; x=1740065411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OyIrs9HvFfKVmUwHZOR1GwKDKzsItdw/GMVirRewx9o=;
        b=U2XwmSMhuOBgElo+meLZb76lMY+QqqoaU/8Lm8atoL26E6soqB0Qp4oFqEIUmXR7Jx
         3bWLcp95JUnbCfs3K4boepbeyWW3cMwflVyvCy9hY80NfkaCC98HVEmbhtaAfxLx1z2Y
         a83yn1SljM1DGYl0XkVsIlCVNQXk+Bytut+nYCxsgtX3vT8NSssfmFnLzGAJrPi5NKLH
         aW7gCLBv13Sqb1oXcalMwyWPpnd4GU9k0rrJIqpX47Vavqlk5D8kZiLvhvexviDZow9g
         CcfBtfXlIe/l83mJeZqyYsct7MTpztErwY5cSMWIDeLYtuFRhnzgzmbGYt+KpcoLGUM2
         +FQA==
X-Forwarded-Encrypted: i=1; AJvYcCUUsFg0oEucaDAeIV/dkSsUL1ijGIB+aU3bxjDHmVdRDvCP5GDV4Q5M5zDHxxalVc/2nF2S8uUzSpo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ/J+X8l1Kl78mtOOofaxWgWp+5iRNy6k0KAVvzs0Lyjyhy/gf
	ZcboH6CKWPnH9XJXD8gTj5BgBkhveHxDNyTNi924YMi5cZ5E/IRwVgRYyXghMA==
X-Gm-Gg: ASbGncsi6b4ym8iVLByx1guqrhU4R7LcSvnImPjpGJDhQIy2x631i7LS/Vm8ghZGmZz
	E+U7ZfcJvp5ldnk7IrF+9ViBnB3hoak9hyejPuCIUoJmP0AWOR1lX9O/sotL5BeBOhqhJaiWNqf
	wg5B2rW2Qu2+rJTsktFe2ChD9Yp27dI9YFrNhX34U5Cxskb+5jYK8V3RQ8f2zZvsWYpFzQSdVde
	iga0RBQpT9oC0C/LyurfbUbuw2w+ikuShSUVlsKFFNZhuRlvRWd0zWn1VpaSExJXq1Oz2Q+20K6
	AvhmeZisrvS/92Ja
X-Google-Smtp-Source: AGHT+IHGzwP5ohgrW42L4Vps5APegav+rOlNPMCt8pEeXEljcFQRbBfg7Tzw7Nsn5o5w3hwG3O27Fw==
X-Received: by 2002:a05:6214:2262:b0:6e4:3cf1:5624 with SMTP id 6a1803df08f44-6e46edb4aa4mr120418166d6.39.1739460611592;
        Thu, 13 Feb 2025 07:30:11 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::9345])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e65d9f36f5sm10395756d6.75.2025.02.13.07.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 07:30:11 -0800 (PST)
Date: Thu, 13 Feb 2025 10:30:07 -0500
From: "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
To: Pawel Laszczak <pawell@cadence.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
	"christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
	"javier.carrasco@wolfvision.net" <javier.carrasco@wolfvision.net>,
	"make_ruc2021@163.com" <make_ruc2021@163.com>,
	"peter.chen@nxp.com" <peter.chen@nxp.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Pawel Eichler <peichler@cadence.com>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] usb: xhci: lack of clearing xHC resources
Message-ID: <b39d468e-beb9-4a44-8fe6-83754ffbd367@rowland.harvard.edu>
References: <20250213101158.8153-1-pawell@cadence.com>
 <PH7PR07MB95384002E4FBBC7FE971862FDDFF2@PH7PR07MB9538.namprd07.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH7PR07MB95384002E4FBBC7FE971862FDDFF2@PH7PR07MB9538.namprd07.prod.outlook.com>

On Thu, Feb 13, 2025 at 10:27:00AM +0000, Pawel Laszczak wrote:
> The xHC resources allocated for USB devices are not released in correct order after resuming in case when while suspend device was reconnected.
> 
> This issue has been detected during the fallowing scenario:
> - connect hub HS to root port
> - connect LS/FS device to hub port
> - wait for enumeration to finish
> - force DUT to suspend
> - reconnect hub attached to root port
> - wake DUT

DUT refers to the host, not the LS/FS device plugged into the hub, is 
that right?

> For this scenario during enumeration of USB LS/FS device the Cadence xHC reports completion error code for xHCi commands because the devices was not property disconnected and in result the xHC resources has not been correct freed.
> XHCI specification doesn't mention that device can be reset in any order so, we should not treat this issue as Cadence xHC controller bug.
> Similar as during disconnecting in this case the device should be cleared starting form the last usb device in tree toward the root hub.
> To fix this issue usbcore driver should disconnect all USB devices connected to hub which was reconnected while suspending.

No, that's not right at all.  We do not want to disconnect these devices 
if there's any way to avoid it.

There must be another way to tell the host controller to release the 
devices' resources.  Doesn't the usb_reset_and_verify_device() call do 
something like that anyway?  After all, the situation should be very 
similar to what happens when a device is simply reset.

Alan Stern

