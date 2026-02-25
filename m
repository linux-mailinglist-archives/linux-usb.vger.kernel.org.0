Return-Path: <linux-usb+bounces-33689-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCbVHPGmnmmrWgQAu9opvQ
	(envelope-from <linux-usb+bounces-33689-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 08:38:25 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBE2193937
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 08:38:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E7A9D3034322
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 07:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD5E2F6904;
	Wed, 25 Feb 2026 07:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PUG0fwgp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD0A2EDD62
	for <linux-usb@vger.kernel.org>; Wed, 25 Feb 2026 07:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772004976; cv=pass; b=ujaWoCSW68suzWp1YN1TuF8FAKUOcwTP5zW2r6l9vUoEC45bBsiDTProaQ7p7dfJGlpw3QnvmlxkJDodcHQYhnOnYjuBEDA0VTA32XDtEViOi0ltjhH0rRgGaD6uNnKLLqvw1aIFZ6C6xgZtAiCnokO3xsNfOO2xfG5/akKlyv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772004976; c=relaxed/simple;
	bh=qPMyRmiQw7pJhER5YKqD7lk1WLwtH8C/KfNioQXmSXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y/B1krXTzsDFs/dEeqZeNWmSalejM4IsaMzY/vyf1xQyqQjUyVWY/BXeS2FVhWCvagcEB2ADlmDwcESmSnykIn4iz47cO4aUhGi1hURzu2WU6kXUommEhAP6x3W70qqReRU2n2AQUKDVUJOv9kZREs4uic7FwJVlbViat1ROp3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PUG0fwgp; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43991cc3155so128345f8f.0
        for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 23:36:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772004974; cv=none;
        d=google.com; s=arc-20240605;
        b=AiadC6D3u7qIYmCz78LvK0KJmvDIlTHaE9bfJpsSpMpNR8UVhbxRcaJDlbxzXEpo5s
         fR8NphmaU0CvhCFuznwz7gOWtLIE0162ptuZCsouCQuIKiL3gDPJPQE29KMGcpF++pNI
         0JMCx75xmipe9+rYIWJxZoZPQkPL64mOyCDmF46KMgNpkCGLhWrSk5Vm/edn1Ah4vfvC
         aCTqy+E+4K5Knzi+yH1GBBxpPx/fENRUIJlGpu/w6WXpUOBQfibRE52uEA6m4lO9HBJ5
         el4epZgrV02tq3YvlFjGVM+nBr1O8xN0XQvZ52nV3hUD4NNBF7B0W6xUAqdjuHMGqldU
         mqKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cPsEREjpbbRl+Ykcb3p5rXFShnBdQuEGwwIZOOJ5aCo=;
        fh=PNnydMM7CRA89svpg5c0wDckQUPFeAQ4kR4LkN/+s7A=;
        b=IUfPipYRbgWFTnJCkMJmIgWwrTk1jxNH02HO6W/5k5ahv9wfeDvhZivGVxPbMLfd+R
         fJuON81PYmYvA39j4b0dtfLdiqS8bJ8RnZ8N8wYe/J80WaGbIhuyT8Yjrr2cQqhldjBp
         v+Is4iQfJUyq99zWT3J2CJWtSydrfo3sWg67cBeNNw7RBpP7NiQlIkkMyL9JOyNC+hRB
         RUAv7YI9ghCP2ab4QglGb1AD1Z/uVGFVDkew5zhqEo78I5D6o43BX2FqNBjOGyKsIWQ6
         aHpJ2mWjvX9b3sp3kthDyJiB+7Mz71waPboNtSWoNCm6CmCHy1EunpRrbmyXZuF6/Tnd
         iVzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772004974; x=1772609774; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cPsEREjpbbRl+Ykcb3p5rXFShnBdQuEGwwIZOOJ5aCo=;
        b=PUG0fwgplVBzSMC2G2vQcXHqb6X/6eDcrRJdxegwb+lxeVbWESdRNczbsXGyZOA+zD
         ZSM6t/28ah8E7kaHKovf8z1mtBKT7t+GgLFtBx3mUrvbD5U9SarbLPyczDV9611so0uz
         LPoRafj2E4W7HflbslC5IUoim3oNT+ra8ZpkupeAeIl/io25q3akz4y/bb2CFIg8EqCR
         Y3De+1SMPE6MfKtTKxNs6VwRjDBVsL1GkuETnScJsy0H/i1cQSQoqfZ4Wsve52nPb7EO
         VEn5vrlI/yy+ylH+mEFm8a2p2omh6i9V14vB1UCwroCPSzUOtryW/RyxV3gNsM30T7T2
         JYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772004974; x=1772609774;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPsEREjpbbRl+Ykcb3p5rXFShnBdQuEGwwIZOOJ5aCo=;
        b=kkiaYyQ+SRE7tTPKSuOcLpg8RQvcxSJRkL1zLU/eCbmbE+H3AB34iKOE2nl6yNFIaw
         YmZ32sLchr5Ks9LeJJNgguueZEpumylcRPfCgUA92NqvO/e2j7Uxi8dy94yplosEicQZ
         PVY+S7PRzPK5VANLjahp+oiw0UBz5oKRdPdmFgMKHncd6VsUxGDc64WIVojewznsIcOZ
         HPBjacNi/+g25x59y4yrgkqKp5ljOctl/HcLzKXT2NjPepPM9U8FKMkgt35/H/aWIVsO
         htDIulmGEtFeNODPhcnauqqMX1nuFMhwkZXGsjI77Npg0vPqy1rFFsoRM8bvMY6Bs9Vh
         8Ydg==
X-Forwarded-Encrypted: i=1; AJvYcCULl/uXti4nNtMqdwaB/WlHaK7Iug8/RJ8rDRtQ6WPdKKGt/rr/1RaGmTGjo5JbI/oJoTyMfXnIdZw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjm7yO/Omc8u0CiRl67eOUxcboc1jf58Bbz+OLeKFIa4oJiK8g
	VXV59DPZUaH3mKwS8kyDabdwFczYN3Bos9UM1559otp3+2zx2DZdujvl/7mzRyK+PMjYwdua5Ne
	S9nHzf1/p162LqBnzloOL4NC2TagxDT4=
X-Gm-Gg: ATEYQzwoOqHLB5Iwjq0Vbeq4o/R3o8LoVGGrB0+PswYG05PN7LyUU+ki2NnIifDpkSR
	pSFVRD9sKXKctZXOm6/h4E7x5xYMpmq1ubNpzWhVHgS/bp+5WhovDr+hcfkuJK4PsLsHOx8LQIW
	P9zBrMJAaRFyeFt/d8EwRydySsfseIg4k03/04vKiwUhnKctRvWUszlaPla+76N6oniC05LL4cW
	VfyUq0Qr7vUuQBXIxaB1KEuEsC0JIqtCEBHi4vgUFCMDfYd2+ebFob+SDRXLqlgnuMWcSWdX7e7
	we+N32sNu6cfX8Y=
X-Received: by 2002:a05:6000:438a:b0:437:6661:fcc9 with SMTP id
 ffacd0b85a97d-4396f17d264mr27401304f8f.50.1772004973270; Tue, 24 Feb 2026
 23:36:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPh3n803k8JcBPV5qEzUB-oKzWkAs-D5CU7z=Vd_nLRCr5ZqQg@mail.gmail.com>
 <95ccf5a6-975b-4543-80a3-595f1ee20543@redhat.com>
In-Reply-To: <95ccf5a6-975b-4543-80a3-595f1ee20543@redhat.com>
From: Daniele Palmas <dnlplm@gmail.com>
Date: Wed, 25 Feb 2026 08:19:46 +0100
X-Gm-Features: AaiRm53G8wva2-r8k7hpjoD_2UgFtTWerh0eqF47qBCR6-DpITxxvsKCTqNKHBU
Message-ID: <CAGRyCJE85fLOahUR3PAUnS_jH4+qpBq37qpged=nvObbg1m+Qw@mail.gmail.com>
Subject: Re: commit 662dc80a5e86 breaks rmnet over usb
To: Laurent Vivier <lvivier@redhat.com>
Cc: Koen Vandeputte <koen.vandeputte@citymesh.com>, oneukum@suse.com, andrew+netdev@lunn.ch, 
	Eric Dumazet <edumazet@google.com>, kuba@kernel.org, pabeni@redhat.com, 
	netdev <netdev@vger.kernel.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33689-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dnlplm@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: ECBE2193937
X-Rspamd-Action: no action

Hello,

Il giorno lun 23 feb 2026 alle ore 15:08 Laurent Vivier
<lvivier@redhat.com> ha scritto:
>
> On 2/23/26 13:04, Koen Vandeputte wrote:
> > Hi Laurent,
>
> Hi Koen,
>
> > I'm testing the latest openwrt state and found an issue probably
> > caused by your usb mtu limit patch :-)
> >
> > I'm talking about this one:
> > 662dc80a5e86 ("usbnet: limit max_mtu based on device's hard_mtu")
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v6.12.74&id=662dc80a5e86b35bbf339e0b87b7cc3f07c09de1
> >
> >
> > When using wwan0 iface normally, this makes sense, but the problem is
> > when using QMI modems combined with the rmnet driver and aggregated
> > frames.
> >
> > - The modem is configured to frame sizes of 16383 or 32767 using QMI
> > - wwan0 (using qmi_wwan) is configured to match this frame size by
> > setting it's MTU to the same value
> > - Frames of this size are sent over to qmi_wwan driver (containing
> > multiple data packets)
> > - Frames are then forwarded to the rmnet driver
> > - Frames get de-aggregated here and sent to the network stack for processing.
> >
> > The reason here is to reduce USB transfers heavily.
> >
> >
> > As you see, it's perfectly possible here to use very large MTU sizes
> > as the aggregation feature by rmnet relies on this.
> > Also the modem can be perfectly configured to send very large aggregated frames.
> >
> > After your patch, wwan0 is limited to 1500 bytes it seems, effectively
> > breaking aggregation.
> >
> > On my tests, download speeds are reduced from >300Mbps to ~.8Mbps
> >
> > I also made a build reverting this patch and all works well again.
> >
> >
> > Is there any other solution to fix this?
> > I guess it should be reverted otherwise :-)
>
> It's weird to be able to set an MTU that is not supported by the hardware.
>
> To restore performance I think the rx_usb_size should be decoupled from MTU max in qmi_wwan.
>
> Could you try something like:
>
> diff --git a/drivers/net/usb/qmi_wwan.c b/drivers/net/usb/qmi_wwan.c
> index 3a4985b582cb..6b4796fac692 100644
> --- a/drivers/net/usb/qmi_wwan.c
> +++ b/drivers/net/usb/qmi_wwan.c
> @@ -788,6 +788,8 @@ static int qmi_wwan_bind(struct usbnet *dev, struct usb_interface *intf)
>                  usbnet_get_ethernet_addr(dev, cdc_ether->iMACAddress);
>          }
>
> +       dev->rx_urb_size = 32768;
> +

So far userspace tools (e.g. also the most important one which is
ModemManager) rely on changing the rx_urb_size by changing the MTU: I
know this is ugly, but it is a behavior that has been there since a
lot of time, not sure how many tools based on this assumption could
break.

There's also the chance that there are modems which require a higher
rx_urb_size, so having this fixed could not work well.

Unfortunately usbnet serves many drivers, I agree with Koen that a
revert is the safest option.

Regards,
Daniele

>          /* claim data interface and set it up */
>          if (info->control != info->data) {
>                  status = usb_driver_claim_interface(driver, info->data, dev);
>
> Thanks,
> Laurent
>
>

