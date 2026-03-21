Return-Path: <linux-usb+bounces-35268-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id tNjTC58yvmnJJAMAu9opvQ
	(envelope-from <linux-usb+bounces-35268-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 21 Mar 2026 06:54:39 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 830F22E37D8
	for <lists+linux-usb@lfdr.de>; Sat, 21 Mar 2026 06:54:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAE213035273
	for <lists+linux-usb@lfdr.de>; Sat, 21 Mar 2026 05:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269FF367F36;
	Sat, 21 Mar 2026 05:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fP1vJHN+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2D9274B4A
	for <linux-usb@vger.kernel.org>; Sat, 21 Mar 2026 05:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774072471; cv=none; b=TvsrXwcnbrLuk2pIIH+CO+VfgLOgi3AviICBDVFsoNMsoOBEb+BZbTsqZm2cdS9kTOY+8rGXxwUdka/Kq0fKcD10AQwobeV/skTUfB1HKGNd8qIzDPwsCr5JYBreIS8kANg3Keqp3PSEe2xn0KOHbjPnLSvtfDDRQ3pQQUeoteA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774072471; c=relaxed/simple;
	bh=A5vY0T+eep85cssQ4kQLZFsPqTQY7NTH044wQ0QdfbE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GSLiB2UwNLjmv5YXikI9pNxhP05AFnkB3jhgBTQ6bjf3a/2RS8GNWJK9t36nm5sfDjWkL9jWIehSafZoj2cpu2GH4nCq6zcLeDBm3kw+RbRnZyQe75Kw6vPDrMyA1hUd/Zkp9oRwWcauwEos3mjErIGAYyf4MnpV+v67Vu/LGSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fP1vJHN+; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b97ba4c2be2so376771766b.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Mar 2026 22:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774072469; x=1774677269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQgQPhvgCvGsrqxaHbMCtB9lBOfe3m6cuPjL4NunDtg=;
        b=fP1vJHN+fyMMFhuirGsyExLip0f7IgTbOGNN103q25IDGbdCIRVg2bN1MI5pb/n678
         DMxRoailAHMNzKz0RFBsw2rxTVjv/GMHm9ahki2MuC7DhVNyPXcR5x6HV7JGnm/+A2RK
         6e/xSvuQX9M1TZHKKzNOWgYp8k1afvMXoAAfMmvIOdNDfy42t6UNFUD0HFDAqJiTv/pp
         awI/P0AwItiP4e2gBmqu7A1koZrYDP+eExR0SUs/LHKlDTXCUleMAnpgDvfaImbW9Igc
         6qX7VDk9qvtA2BRlJyXmRJQ+6j2F9MJO0LRVgpKmEymZ9KLXCHubOAMW+CwMvrYa7GFJ
         YPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774072469; x=1774677269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qQgQPhvgCvGsrqxaHbMCtB9lBOfe3m6cuPjL4NunDtg=;
        b=ZqFZVfSrLmkhRffeu0/cGqoH795fIYQeeKtN/XwhcIP7SqJZhMNzLLqjF08u/VR6Z1
         uXtgM0h+cdxvmenuh/hJqUWz27ZHRiF8losXbtdztRHcBK/GRXVoG3zH3x/w1MBDJCr9
         4zakyj+MJwEj7yH/tuw7QtfVjAwKAdCWDrXx+DmK6gWJXY/CTG5xDmyObyLZrTcwPWrl
         RwciLX/BaddzBSoVwreIB/Z0xT903UzAFrIW+Am28331gVm+q3X21KWxdr6CJczDEk9j
         bQ0Hgm90VsMPxe84JSgSu0UU1aP1YDFLI+S5t932jHFJt7ZvFIeg6R0X5y4BLTHHg4bR
         Xpfg==
X-Forwarded-Encrypted: i=1; AJvYcCWa1exDZZPHdy/Wfnnp6aMKQZFOngB4rIuCsysrUNkV/IhEWBlRt4bTAX+PyTNyYzNIUziBkg7/vP4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrkh3h1MOi2s7kuWSyJFUjHPrtofYXxeJBNDJdNGeg5p9+AK7i
	/ZFzTTePpur2UNIhsc4zF/QHl0RDtwXxCdKRKZh6xhsPT6FDx6idQj6r
X-Gm-Gg: ATEYQzxl7t+9iEHf1CDJ7K8qoTeVQMtOtRvqqtpKXZqCRPA6VDVR2NPpbNFBkBEP0B8
	1kcG8TbvNzIHjpB8szU9opGRzbHWJgeBL/so1QYlKzIIZq3/FBw1xf6LTKenxKtjNwO7LHvkiok
	GMSItczEZkIB1ZmSmlFy940QEK0dPhSH3DszzZ3fKahYIunKc8dbz6aoI9qJjUb0JK2BbUSsC14
	hc6DFf+EThUVKRy0SfQvcFGBVp9B4eoOUuND/okStS2BhXyIpb5cQZJYM+JP3nx6kXBqo7aLdq5
	ajgyVCoAnqrMiQfSTb51B3ajkp0kmeeeLxcGmaJHRcXMHODN2/Mry+6trV2PsrPlznekpJeRpKu
	ke73DWNbgPdLQhOlW0ECOSqrM90R8SmMMkr1xwYnQUvCtbzUdh4PhZFWPAq584fIYojICjGNA3Z
	aPcGbfN9yY7j14fxO6Nupyfx5FotCymiJnZJ0fHtdhQi/Keg==
X-Received: by 2002:a17:907:e10c:b0:b97:9130:659e with SMTP id a640c23a62f3a-b982f24517dmr256117466b.3.1774072468286;
        Fri, 20 Mar 2026 22:54:28 -0700 (PDT)
Received: from foxbook (bfk214.neoplus.adsl.tpnet.pl. [83.28.48.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f440e7sm237561566b.3.2026.03.20.22.54.27
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 20 Mar 2026 22:54:28 -0700 (PDT)
Date: Sat, 21 Mar 2026 06:54:24 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, Oliver Neukum
 <oneukum@suse.com>, =?UTF-8?B?QmrDuHJu?= Mork <bjorn@mork.no>, USB list
 <linux-usb@vger.kernel.org>
Subject: Re: correctly handling EPROTO
Message-ID: <20260321065424.76a80508.michal.pecio@gmail.com>
In-Reply-To: <20260321021439.7pmcdrpb5oxbivct@synopsys.com>
References: <abcd2076-c2d4-403d-8ab8-af747b335075@rowland.harvard.edu>
	<87a692e2-559a-4765-8321-a422751d3589@suse.com>
	<4ada5d68-56f1-41b7-82d9-463901c927db@rowland.harvard.edu>
	<8a14fe29-0d92-4ce5-a7e2-2c084c710727@suse.com>
	<b0217cdc-f263-418c-b8b5-584520d0b1db@rowland.harvard.edu>
	<20260318223851.1f6d07d7.michal.pecio@gmail.com>
	<20260318235920.ioek26hdr25rkksp@synopsys.com>
	<1eaf4cf3-4278-4d04-87aa-8b6069d544e1@rowland.harvard.edu>
	<20260319231620.3ukqxsrwqikp5zbd@synopsys.com>
	<2929d47c-fc02-49d2-873e-758f24c43071@rowland.harvard.edu>
	<20260321021439.7pmcdrpb5oxbivct@synopsys.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35268-lists,linux-usb=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 830F22E37D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 21 Mar 2026 02:14:46 +0000, Thinh Nguyen wrote:
> Windows has a clever way to handle this for UAS. It sends a
> command/task with the same tag as the failing transfer on the command
> endpoint, triggering an overlap tag response and causing the device
> side to cancel the command along with the pending data transfer. This
> puts the host and device in sync again.
> 
> All compliant UAS devices must support overlap tag detection.

Doing what Windows does may be a good idea. I have seen certain UAS
bridges cause problems on multiple xHCI controllers when data URBs are
unlinked after receiving an error status. I suspect those chips may
violate USB3 spec with current UAS driver, but I have no way to debug.

> The clear-halt doesn't have to be done after the unlinking of URBs.
> The xhci endpoint is in stopped state after a reset ep command. As
> long as the class driver doesn't submit a new URB to trigger a
> doorbell ring, the xhci driver can send a clear-halt after a reset ep
> command and no transfer will start.

Nope, for many years now, if not forever, xhci-hcd has been restarting
the endpoint after giving back the failed URB if its completion hasn't
unlinked all remaining URBs.

Changing this is one of the issues under discussion here. It would take
a few tweaks to the driver.

Per kerneldoc, you should unlink URBs before calling usb_clear_halt(),
and xHCI *requires* URBs to be unlinked in some situations, though you
wouldn't run into that if things worked the way you described.

It's another case when old USB2 spec arbitrarily dictates how software
should conduct its business and later xHCI assumes that we do. Annoying
as it is, it seems safer to follow the spec, particularly if URBs need
to be unlinked anyway to retry or replace the failed one.

Regards,
Michal

