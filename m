Return-Path: <linux-usb+bounces-37121-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +O+gDfmv/WmlhgAAu9opvQ
	(envelope-from <linux-usb+bounces-37121-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 11:42:17 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2BB4F4597
	for <lists+linux-usb@lfdr.de>; Fri, 08 May 2026 11:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFF52303DAAC
	for <lists+linux-usb@lfdr.de>; Fri,  8 May 2026 09:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE3A33BA253;
	Fri,  8 May 2026 09:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fWWIKXj0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C823C276E
	for <linux-usb@vger.kernel.org>; Fri,  8 May 2026 09:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778233295; cv=none; b=hYznwcpFHIEuH7PyzYFgoJ50wmnAkiv7Q0MLlWgj77+MMoys4LEHshQ9oheve8iDBxHqjhUsq2TQr+JUkbUUzXbvVkG1rlg/jSSBdo1PvfQubTw2CGqBZoEDmTZ5NnrcpovrIk9EJoByR8A2cbTL3cq7vJpjADp3DEoqzLV7g+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778233295; c=relaxed/simple;
	bh=1g0u+8GxM9IWQW7wW0Sx97FwaLQfmte7AaIvms+3+N4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MPGyVCREpcmter5HObfNsjJzvcCOI2ruki7W9WOxctBs73kgu5cILCWavcAFub1qwSWvfGcELJvprusRUrofnzjfOBz25XU4XSyzGPmJMj3/bOwQ/tu5OvbCj5LPQSnYHcO+ceQrXIZoXoas0z4gTxSDd/IGz+/D5208SrWhEcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fWWIKXj0; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-453903ee4adso1276672f8f.3
        for <linux-usb@vger.kernel.org>; Fri, 08 May 2026 02:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778233292; x=1778838092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3VBcF9CvbVf+jNotWmEKGKAtYMBjXrGpjYE3N2Ac9G8=;
        b=fWWIKXj00fhOFO62QPFfW1clw8a/g9cy8/EB7pJZCwWfQT0Drp2hknxH6m9Cltg41N
         FonUM8Be+Ae6l/mMCtbPIhtdzxa6iIfmM8iVYt8yax1H6wF15+57/5z5PdI78xYlblls
         ktqBZfkaCbr/2ZP+koT9jV4rSj4/ayJOkh70aybrN5TxSyBhytfoNf21VK1apt2a6oaH
         9sr6+ft66KAOUUd1Pwfqwn9KRpjGEpM40//WN9ggDKol/Ev15ErT5oGzBkzguIMsMl/z
         m2hQ/VT+R8LwDtTqyx5SGIfGsZD1PZpUHRYfJcvaqp0k2gG66WlQD4sJcoEKGCrtXWD8
         4LbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778233292; x=1778838092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3VBcF9CvbVf+jNotWmEKGKAtYMBjXrGpjYE3N2Ac9G8=;
        b=ZYAFjZZOq98cWKjrLNsh+xcu6eN0+RuJGb5eFkL4+MST3sBRZjPCzM6ouyZUgjkpzB
         w8OzTHfSDU49X8BkE3dF8d9wuIYk4YcQ+ysI7MennVN8sOoafjDhGYzRHnoDbynHtELZ
         NVKciG3LJqsNsvLPS+Wy+sTEVsCck1tNBW6kLEWuq26PFayKE6RGyjx7jkId9UniYHLe
         +CQk10qyn/3YuBs797VFnJFRsfL5uHVrVVPwBxCzjP+WhSSBzcA/1atJHAsgXQlUOZRW
         8S02jxwBLsba1alb3KtkmrMV80bbbmNCSd5I19a5ipupFI1MmtOVeSHWUam3uW2Azuz4
         AEXA==
X-Forwarded-Encrypted: i=1; AFNElJ/AGu2vMRZ0mMvd5NmakePJG34YOZvH0Zpcs6VqixYvDrWy7ViTwNBI/TWzeFzyYr/lJKgv/Nhu+Kc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYniasNsUJ7kvR2T+osyB4hftULoYkBR9ZXFFBixRLKNqpik0d
	tJWnCyygJMXedis8RhgVTb0IIPNe3LmTf2vq1dkp5JxaAWqPivfF9It+
X-Gm-Gg: Acq92OH4hV7qWGx41Mk/IKXgbTWKpJYICzDDjwoVklrHqZ0C3JFM3uZjpkPjVgUOUrK
	m5rs6BCsqM7MMlIMlq2oqZuPK/4HY2SZZjuPZcI6zZlN+Ck7MVHjGTWQpGhcQxW9PoFsauczJiD
	n6wiYla0a6Z+p1joim6zmS3ISTwOgE8NHS4p0ltdP9XYINR6AVUtRghIyCqxcgt9pznsB8syR2r
	HELb5j4rE2itj2vN8hghZNRcDU3sVPd42vrylcpXWqOzT0gGQm2bpv168aryo0MfitOD4cReIui
	Rilz6+/t86T3wH5GlEZerXWoWhagq3k4elbbghsMN6wKirkNOWIo4iDawCpEMF+FO9VROVr6l32
	fywyWst9ICEYCSqwxwRPmIiPQMITeKBvpXqO9RWJF+emIv6f35+G56jQPg3eOf2mOLmZ9AJjl82
	v3iZote3Tq9K+iSM0foXU+Zzdog7xz3RkRa50=
X-Received: by 2002:a05:6000:3107:b0:43f:df1b:9e07 with SMTP id ffacd0b85a97d-4515df64297mr18623135f8f.42.1778233291984;
        Fri, 08 May 2026 02:41:31 -0700 (PDT)
Received: from foxbook (bgt227.neoplus.adsl.tpnet.pl. [83.28.83.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491304505sm3198483f8f.22.2026.05.08.02.41.31
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 08 May 2026 02:41:31 -0700 (PDT)
Date: Fri, 8 May 2026 11:41:26 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Dylan Robinson <dylan_robinson@motu.com>, linux-usb@vger.kernel.org,
 mathias.nyman@intel.com
Subject: Re: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame
 and always assumes URB_ISO_ASAP is set
Message-ID: <20260508114126.68241973.michal.pecio@gmail.com>
In-Reply-To: <ee3a6ab4-081e-4d7e-98e6-e39b2c087c4d@rowland.harvard.edu>
References: <bug-220748-208809@https.bugzilla.kernel.org/>
	<bug-220748-208809-eL7PrzeMxr@https.bugzilla.kernel.org/>
	<fe08eabc-4f92-43fd-89d7-5e9d0e35c979@rowland.harvard.edu>
	<CA+Df+jdtQrYye85d7uZyT3jirsztKhf7qQes3LvOAPa+9qxSOw@mail.gmail.com>
	<20260507235432.71d28151.michal.pecio@gmail.com>
	<ee3a6ab4-081e-4d7e-98e6-e39b2c087c4d@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: CC2BB4F4597
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37121-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, 7 May 2026 23:09:18 -0400, Alan Stern wrote:
> On Thu, May 07, 2026 at 11:54:32PM +0200, Michal Pecio wrote:
> > Alan pointed out that kerneldocs are more up to date, but there is
> > still a crucial error there: on ehci-hcd, an URB submitted too late
> > completes with -EXDEV instead of the submission failing with -EXDEV.  
> 
> I don't remember the details exactly, but are you perhaps not taking 
> care to distinguish between URBs that are partially too late (some of 
> their packets' time slots have expired but some have not) and URBs that 
> are entirely too late (all of their packets' time slots are expired)?
> 
> As I recall, the first case is supposed to complete with some of the 
> packet statuses set to -EXDEV, whereas in the second case the entire 
> submission is supposed to fail with -EXDEV.

... which was an artificial distinction requiring drivers to handle
substantially the same problem in two ways. They didn't, therefore

24f531371de1 USB: EHCI: accept very late isochronous URBs

changed it to EXDEV completion in all cases. AFAIK, this code still
stands. I can't find the string "EXDEV" anywhere in ehci-hcd source.
Note: every frame start with this status so in case of missed transfer
the driver simply leaves it unchanged.

Regards,
Michal

