Return-Path: <linux-usb+bounces-28918-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 311CBBBF000
	for <lists+linux-usb@lfdr.de>; Mon, 06 Oct 2025 20:39:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 883984F0DB9
	for <lists+linux-usb@lfdr.de>; Mon,  6 Oct 2025 18:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3337124395C;
	Mon,  6 Oct 2025 18:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Upakn7DH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E77B661
	for <linux-usb@vger.kernel.org>; Mon,  6 Oct 2025 18:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759775935; cv=none; b=uF8vf0Xjo4CJYDwUhP/gwDCH9UENMKMh5Jj5cJw59qOSUfOpX7lY2FDpSV/sA5YtJ57YtOG7wn0OxTeb7Si9/ykNzNSihgYsArI72xGc1hjEuq/7xyn1eQAv4ShR6cWOJtp0FJBKgNWTdzqSTuHkaJvpbyZRs2S9dZcjGwMbaqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759775935; c=relaxed/simple;
	bh=iYEsGOTFQmyZot95ZBwGLx8ywbMkTyf1DXQeEp1zan4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xkc/NxBp+gfcQjo95pWqpn/C74/w1P/w54JPvZF3WtblrYpugWGw8ixjocPpjfFgieHVLuCrwKUoP7zd/06sXsdY+/ejG/OTmfy8ciopxz79LXp9CKkmOXYzAo952XQkGOMWMF1tgKVUwYmYGAk7703sWAzh5U4Bif2VZPzlLrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Upakn7DH; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-57bb7ee3142so6383063e87.0
        for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 11:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759775932; x=1760380732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QuipuM4AgfAg2xSmfyMonjbcCFLEsp8TGGQf+72m0g=;
        b=Upakn7DHpHh7kvrzN0YwKxR2Sj5p83as12bKFOL+zm776NFz1/wRsxCkoGmk/wxjyq
         j2c6rOqRWNwvx5RCTT6bP4IDarHIVJ/tJzlbCcw76Tobf2wqtXqrLHkPnw6ofsjtg501
         tnj86+glYhbVe8iiV30cfjbWa4l8dzhAq4qR9JdWODjt9dROSRaNKn4jUczPzw3ZZhCl
         EPLHT/F7X+jtMqqDh358ahJA5yYh3BxZRn+DIJD0gxkMHkpbgJy43yEhDxJ6fsAJyD8S
         YtRBf1FzCzKQ+NT840YDd3zHtFYEgTAyKlYmPun5xYMPCG+KKusa/5+BzheMjmFWGHz5
         nmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759775932; x=1760380732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QuipuM4AgfAg2xSmfyMonjbcCFLEsp8TGGQf+72m0g=;
        b=DvhBCc6YDO8GSE68yuHPugkzAaw3Mvt8/NHogz8MibwUo0dHsVW8oSGC5/y+wMicIf
         nHCUaJr9rS9+A4bLK07UHhQG7U0rvlzvY2kT+AFRWIyZFsX/V4Q8Cewzb37G2b0lQ2dm
         09uQUVIgEJ0HA6JGKHr0i8n/IMLjEViDru0x+enGdikGVbOgKPKGjrwbWX0ND2RcBPNQ
         MBJBLxfGjF1hGHmoXQv04nC+w+xU+NFSYaV0NZRx5bkCHhVQI0mtJQJz8eg2a/YnlKpC
         1rJoGycAR2SJo0NK8BFEK8OuoCpXg1LckUAmeDKfWn7+ycA+OxBSDggi41zanZza0u/B
         0ZDg==
X-Forwarded-Encrypted: i=1; AJvYcCVHeHcLFUkJlLool4nh9d2tGq2fW9mJ1iuh6De92DMPTj/G1HhnPBVrlayFLQpLiMdlLBIFWVTINgs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2MbMgqzNK+R+Xpf9Opqkl3RD33JL8p9xNNxwh6IzBJD+tkg7p
	H4WklXRKaD9GDxIgbrtykDG8uOL3Jqiumea3sjOhbgHF06iavuFaqjmk
X-Gm-Gg: ASbGnctwgwSNqSiUcsTvCqXMnaPC14ld8bCwAkH+iiUB+JesDJHohM2W/hUVoOJOnjv
	f4ZyZTumCP1wRI1oL8Kj/cd8XZTtJ5QKTz5+iuQlwu0dpQt/xcenL+HuIRILd40pgazDRV54EEY
	BRjH5EosEfdQQSNReKgWcxdg8BZxtedcqsHWQCW1jPWP5dgsWlwlrJx/BDCugE2piXBGoUpNEz/
	8xMafYhfeTzmzFLExDRK8XMHC5CvR+8oNUU/72f76rO1wdUWKt5g659+ZQ192guyshLJa18WVrQ
	zrJNscyzVn2h1aVXRN/CfCms44DfddAWIkQp98p/se/Mqm4+9ywPcFr/kJhr52f0SaiBpdtyO80
	9qU9SWiqcNUE3puKdynUKJ287dZEMvZ+Xuk1jENwNJejwMW1L3DpC9B6TLdo=
X-Google-Smtp-Source: AGHT+IGn7FAGIRKwo91WS+YO57FrpNiedEAU87xXSFWA6N9Sl9WsC4AW0k0tnqMsIZD5ntN943ANWw==
X-Received: by 2002:a05:6512:6193:b0:562:d04d:fa06 with SMTP id 2adb3069b0e04-58cbb4419d8mr4501577e87.32.1759775931655;
        Mon, 06 Oct 2025 11:38:51 -0700 (PDT)
Received: from foxbook (bff184.neoplus.adsl.tpnet.pl. [83.28.43.184])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0119ece7sm5226604e87.103.2025.10.06.11.38.49
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 06 Oct 2025 11:38:51 -0700 (PDT)
Date: Mon, 6 Oct 2025 20:38:46 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, "amardeep.rai@intel.com"
 <amardeep.rai@intel.com>, "r.kannappan@intel.com" <r.kannappan@intel.com>,
 "mathias.nyman@linux.intel.com" <mathias.nyman@linux.intel.com>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 1/1] USB: core: also treat eUSB2V2 as eUSB2 regarding
 ISO transfers
Message-ID: <20251006203846.203790b4.michal.pecio@gmail.com>
In-Reply-To: <692e4565-507e-430c-ba97-dc6d6539f800@suse.com>
References: <20251006164500.131899-1-oneukum@suse.com>
	<20251006180610.lhlzfeo5z6zxgekm@synopsys.com>
	<692e4565-507e-430c-ba97-dc6d6539f800@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 6 Oct 2025 20:14:46 +0200, Oliver Neukum wrote:
> On 06.10.25 20:06, Thinh Nguyen wrote:
> > On Mon, Oct 06, 2025, Oliver Neukum wrote:  
> >> eUSB2V2 devices use a bcdUSB of 0x0230, not 0x0220
> >> to identify as eUSB2 devices, yet their endpoint companion
> >> descriptors must also be parsed.
> >>
> >> Fixes: c749f058b4371 ("USB: core: Add eUSB2 descriptor and parsing in USB core")  
> > 
> > This is not a fix.  
> 
> It is backwards compatible to eUSB2V1, isn't it?
> So we are failing to treat an eUSB2V2 devices as
> an eUSB2V1 device when we should do so.

Hi,

What is the actual problem you are trying to solve?

This descriptor is a v2 extension which is simply not supported
by xhci_hcd and uvcvideo (nor any other in-tree driver AFAIK).

Parsing it will hopefully have no effect at this time, and it could
only have bad effects, if some parts are ready but not others.

Removing the warning alone seems safe, if somebody is complaining.

A device which has this descriptor will hopefully also have alts
which don't have this descriptor, and then it will work as a v1 device
with those alts, whether we parse the v2 descriptor or not.

Any driver with a clue should avoid alts with wMaxPacketSize == 0.

Regards,
Michal

