Return-Path: <linux-usb+bounces-35811-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gADZIymTzWklfAYAu9opvQ
	(envelope-from <linux-usb+bounces-35811-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 23:50:33 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE41380B93
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 23:50:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6FB4D303B04F
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 21:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3B543859D5;
	Wed,  1 Apr 2026 21:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AqzvcPSA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08D035CB61
	for <linux-usb@vger.kernel.org>; Wed,  1 Apr 2026 21:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775080229; cv=none; b=a6NsuGcHLQPHtiSVCHPr3dZ/l2QfgYnO4AQdneMIowte2h6lbPU0tnKCEZXEmSN6p6XXkwDOB7X+jG0Bqp51z8m9cwz8wpG0mWMQTCC2EhZXBPbm1hoCWXIbeHTsI01ZIgo4mjJ0aoz6uilN9K/+U1ns8dsW231LnP+583WQOHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775080229; c=relaxed/simple;
	bh=RqHdpb2duUGJ6d2wphqaOZhFeV+NWj1fFWhss2Vhq28=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QoqLDWIIhJxdRVZRLaCsjLr4w4K+cL1Lj+VZzmqSrxCDzaVWSksDa1umLv0PCHhdDItNK8iMxXCdqcnjlzo52GDJ/P6hY87kUSxiPqspdZAp587eGkSWAyyPPOuHy5qtsHNFHpqHnfD6KoL7WDX/0+zYboLyN+gp6SC5LKdJdKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AqzvcPSA; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43cfbd17589so216455f8f.0
        for <linux-usb@vger.kernel.org>; Wed, 01 Apr 2026 14:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775080226; x=1775685026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OmvLeu1XrJDKXltfSiF2gr8Yip2920el5FDRpp8OtAg=;
        b=AqzvcPSAcOHEqjrSeH3Y39mCdwpKUFZMhJkyblvAxCWp05iMPOgybXA5HfldugmKmG
         91L9nXv/+YjKodiqfb58nbZFXmekPJhyyXMdoBrG3iNjvYtEf9QP6fw3qybwKc2+/wEe
         k+OqR4UWxpGvASB+XU92iyiKSaTU3QU2HrZQ7w2WAFKpJ1j1ivaS0YI+vUkMGNHrSTKC
         7kDf/HvQVzaXwfIZNSynV3eq21eD399INM1V6i0PFLRs1BmBVL0RAWJPTSr29bIlhgmC
         Pk0i1VWtdo24M21FAGvDONoZG8nKF8CEnw0e+t+fq3ENUPhgmJFqlKGT8KQOBaY1XD/Q
         xTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775080226; x=1775685026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OmvLeu1XrJDKXltfSiF2gr8Yip2920el5FDRpp8OtAg=;
        b=jjecAuClJr5505x8j04hJDt8Pie+XtLVborme2gVNpOfKZ/p2TX1hFuazFMLxtM8U2
         sJkxqPRZKY9ZdM/wgW24iskGq1VyltKaGg9MfC8vYm3BjNMRGaOtQhuuVeGzhJ5bpi3L
         v73BxG5u3/Ph6rJSOMcaj8uqFKhlUFtGwtl8+ugygyn6RbFCxgyq2EFn+GunK/LR32hL
         sZzIKPV3FaM0AmrOGHw3nneQ7ksiG6ywnWNp4Q35aFKe6Ol1EYBbfSy332q79zYUQ3Km
         oEBvHq+1iXa5N4s043eET4efv6iD0pOudjGXMifFq5+YEoRpboseba8J41LNUesQK2V4
         /EUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLvYEpyMNb6ZWDuq0Vre2QUXkt7CfAFkXE9v0RF89uak/zBKbhfCffIyyruYEbAjAkoKrMXW8/PYo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf1CyUZSqJQgDDGOK/EXpC3McVU/dYGzP1OegohQ6mn5Akhqd/
	fNWuG4muvwnc1XL5uEww2XHMO5n62yA8lXNBp4wzC0vW/9TMpvAsbTEf
X-Gm-Gg: ATEYQzyrFyn1K1wHZZjqXNNJ8zjGFsxBfziFHAMLcVojzaebGGqHt8NtW6jVJw6x03q
	/Z45+M0fTLa5ObhWGc8hU0tZcGrzcc1lVSmVFQbN0U909+WiksLZSVF/9M88QbkrD0VPEFGxkA1
	3DuUhZKgdfx5G0AJd79Wl518XUpmToMV4vJQ6/NXCueK64EK9ZzmZ9tz9lS8tCn7DrH9y3Fypkp
	xQ5j99aAyQs00sfCDT/3SPV5rNPeJZBQRqfuFaN2aOui7Jv5tl+fTtfIiX9DzAYeu7LPhRFXw23
	hdYbj6+MN0Bl2vfXSOmNJC7rtjCwkHavCyKG2Q/eXfqeIbBY/ZWG3H9zvpKs3LVrT5sJifGFtD7
	lddkFbQ0SnmeshavQDbwJesWz7jlxUiBgKr+RwXO5gCEQsL0cYUkklGU+PedeBh4ZpNYJI6Bcxw
	xjDdq5AmXu0ASI68mbhF8Srf8ZUS/8GkqL
X-Received: by 2002:a05:6000:24c1:b0:43b:3cdc:941f with SMTP id ffacd0b85a97d-43d150869ddmr10250408f8f.17.1775080226148;
        Wed, 01 Apr 2026 14:50:26 -0700 (PDT)
Received: from foxbook (bfi53.neoplus.adsl.tpnet.pl. [83.28.46.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e56fesm2551428f8f.27.2026.04.01.14.50.25
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 01 Apr 2026 14:50:25 -0700 (PDT)
Date: Wed, 1 Apr 2026 23:50:22 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Oliver Neukum
 <oneukum@suse.com>, =?UTF-8?B?QmrDuHJu?= Mork <bjorn@mork.no>, USB list
 <linux-usb@vger.kernel.org>
Subject: Re: correctly handling EPROTO
Message-ID: <20260401235022.67037c98.michal.pecio@gmail.com>
In-Reply-To: <20260330143600.0594f0da.michal.pecio@gmail.com>
References: <20260318235920.ioek26hdr25rkksp@synopsys.com>
	<1eaf4cf3-4278-4d04-87aa-8b6069d544e1@rowland.harvard.edu>
	<20260319231620.3ukqxsrwqikp5zbd@synopsys.com>
	<2929d47c-fc02-49d2-873e-758f24c43071@rowland.harvard.edu>
	<20260321021439.7pmcdrpb5oxbivct@synopsys.com>
	<20260321065424.76a80508.michal.pecio@gmail.com>
	<d3fd1c0b-d0cf-40e2-9f21-b4c5de1c421b@rowland.harvard.edu>
	<20260328222217.297200bd.michal.pecio@gmail.com>
	<22c70ca7-57dc-4328-a5cc-d46c4f73556f@rowland.harvard.edu>
	<20260329184611.0afa92c7.michal.pecio@gmail.com>
	<ba68bdbb-9ffd-47d3-8915-9e2e40fd6adb@rowland.harvard.edu>
	<20260330143600.0594f0da.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35811-lists,linux-usb=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2DE41380B93
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 30 Mar 2026 14:36:00 +0200, Michal Pecio wrote:
> UVC allows both isoc and bulk transport. I have one bulk device and I
> found that if I randomly change urb->status to -EPROTO, the URB is not
> resubmitted but (on xHCI) the endpoint keeps going, until it stops after
> 5 errors (no URBs left). EHCI would presumably never restart at all.

I tried this again with real transaction errors (dodgy cable) on EHCI
with disabled XactErr retries and I see identical result. Failed URBs
are never submitted again (checked with usbmon) but the endpoint keeps 
going as long as there are other URBs remaining.

[285740.194700] usb 4-4: new high-speed USB device number 3 using ehci-pci
[285740.243438] usb 4-4: New USB device found, idVendor=345f, idProduct=2130, bcdDevice=21.00
[285740.243448] usb 4-4: New USB device strings: Mfr=1, Product=2, SerialNumber=7
[285740.243452] usb 4-4: Product: USB3 Video
[285740.243455] usb 4-4: Manufacturer: UltraSemi
[285740.243457] usb 4-4: SerialNumber: 20210621
[285740.263078] uvcvideo 4-4:1.0: Found UVC 1.00 device USB3 Video (345f:2130)
[285745.210034] uvcvideo 4-4:1.0: Allocated 5 URB buffers of 30x512 bytes each
[285745.563613] ehci-pci 0000:08:00.2: devpath 4 ep3in 3strikes
[285745.563667] uvcvideo 4-4:1.1: Non-zero status (-71) in video completion handler.
[285745.830190] ehci-pci 0000:08:00.2: devpath 4 ep3in 3strikes
[285745.830233] uvcvideo 4-4:1.1: Non-zero status (-71) in video completion handler.
[285746.145090] ehci-pci 0000:08:00.2: devpath 4 ep3in 3strikes
[285746.145112] uvcvideo 4-4:1.1: Non-zero status (-71) in video completion handler.
[285746.500756] ehci-pci 0000:08:00.2: devpath 4 ep3in 3strikes
[285746.500778] uvcvideo 4-4:1.1: Non-zero status (-71) in video completion handler.
[285746.771547] ehci-pci 0000:08:00.2: devpath 4 ep3in 3strikes
[285746.771571] uvcvideo 4-4:1.1: Non-zero status (-71) in video completion handler.

# urb1
ffff8881a653ab40 3478085173 C Bi:4:003:3 0 15360 = 0c8d8a89 cd94dc59 d1941900 10801080 10801080 10801080 10801080 10801080
ffff8881a653ab40 3478085194 S Bi:4:003:3 -115 15360 <
# urb2
ffff8881be27dd80 3478085930 C Bi:4:003:3 0 15360 = 0c8d8a89 cd943acd d2941a00 10801080 10801080 10801080 10801080 10801080
ffff8881be27dd80 3478085955 S Bi:4:003:3 -115 15360 <
# urb3
ffff88814746f840 3478086931 C Bi:4:003:3 0 15360 = 0c8d8a89 cd94fe45 d4941b00 10801080 10801080 10801080 10801080 10801080
ffff88814746f840 3478086995 S Bi:4:003:3 -115 15360 <
# urb4
ffff8881617b3480 3478087544 C Bi:4:003:3 0 15360 = 0c8d8a89 cd94fab6 d5941c00 10801080 10801080 10801080 10801080 10801080
ffff8881617b3480 3478087563 S Bi:4:003:3 -115 15360 <
# urb1 errors out
ffff8881a653ab40 3478087703 C Bi:4:003:3 -71 0
# urb2
ffff8881be27dd80 3478088803 C Bi:4:003:3 0 15360 = 0c8d8a89 cd94f730 d7941d00 10801080 10801080 10801080 10801080 10801080
ffff8881be27dd80 3478088813 S Bi:4:003:3 -115 15360 <
# urb3
ffff88814746f840 3478089546 C Bi:4:003:3 0 15360 = 0c8d8a89 cd949cc4 d8941d00 10801080 10801080 10801080 10801080 10801080
ffff88814746f840 3478089554 S Bi:4:003:3 -115 15360 <
...

Not sure why it happens, maybe it's just the async giveback race,
but it worked like that reliably several times.

