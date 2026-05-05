Return-Path: <linux-usb+bounces-36986-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMmrMnNC+mlJLgMAu9opvQ
	(envelope-from <linux-usb+bounces-36986-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 21:18:11 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 463924D3110
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 21:18:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 31191304F40F
	for <lists+linux-usb@lfdr.de>; Tue,  5 May 2026 19:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D0E3CF692;
	Tue,  5 May 2026 19:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Od4TOvL6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77633AE191
	for <linux-usb@vger.kernel.org>; Tue,  5 May 2026 19:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778008685; cv=none; b=M12AX2j3LZWam9lucAf+O4tpI0mZU/Nd1jItKD68cSFhCLblAjcSM7a+l9o7P1uowL0b+iv5TQE3IqeHE9btVgInFVyM0Z/S7cmF3cUlTQuY9neTmkzxNKXXSULGzcEF9nCJf+COfQoKkfE77ODrJaDfSXMc3avale9MWwtwat8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778008685; c=relaxed/simple;
	bh=w5rlEyJ4UP2UqrMlSy+67UjvKMoRUIPuhBaIMbf8zOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mK8k104p7GyNaidprPi0TAVWI/RhAGxz1UoxGhn5V3w6/g5eqMWHPFWTW6c5KpZUD6DDcBjCx5OE0ut2F5mwkm32u+vhb5TQ12/1JLrhkyhJ+EUr/h77Ua5BXayfvuQwRr/DxTBwIFIhf3EtAShtHPLileAWUnBdvfTJ2h1TUzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Od4TOvL6; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-50fb4a7d704so45281381cf.1
        for <linux-usb@vger.kernel.org>; Tue, 05 May 2026 12:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1778008683; x=1778613483; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o5keH+/MuTo7RgZ50BvSKxaSrsiXOE3iaYjzzu5jCSQ=;
        b=Od4TOvL6hofo+0tXA8qhyw7qlgMFIzcV+p/sStfl0bbKbIe1gQJ1xqZUJvTLwUo4fX
         0lpxafV4w3kIIal61/wvIaBYkRnjfXKdV3N1zEPSdFxDIcpWUTbIVLw+XvCGRbOoYMkj
         rFdaLQ7wlIZqM0sjyx9GM5fpf+vSOVMVYXXdcZ7jaMsVSJ/t4/3ZiaJOZY4qJp5WIo59
         JErZ5Ki98I1OBmlOOvEP9v6ihUG3iZO9hRo6qv8JjkDJU1aWbVo4WOyzW75I0gMdpqFO
         2Wm9ogT+y9zTPdF6P6umvPJDScz7+JADoQnhjb5fejii8aySuq541tuZQQ5QJnuzdEE0
         b5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778008683; x=1778613483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o5keH+/MuTo7RgZ50BvSKxaSrsiXOE3iaYjzzu5jCSQ=;
        b=PphfivkAaZZVkeJ62TXfSF44Hebw/5dP2UhCm23rdP3gK2NbLfU4dZrZt0pSfDqU7b
         Wwduh82WkZc5614xDnLhmRnuontutzBdfyjU8qafQ9h08fKCyeqCxC4io+N0sKvCQAeJ
         uk6dvpqoln9U0kCMw/cnIiCaeUN9dOq//gdU7cJwtiG2S71lSLKLnCrqJgZ2ZCf441Ew
         Rc4NZUfnSNM2QiClcSLEcBtxn4m+Hdh53sBMIPEVGVsnkSfyVw/OlHGHAWmn5LIzvqcQ
         srJNO/cY08DeDKGBJoAv2oNgN9q+/8O6VLkx6UNJ6FU8dO3/cb/0EgrzOpFVBY1FC5sT
         b2KA==
X-Forwarded-Encrypted: i=1; AFNElJ+dyWm2V9KsqHmbbwfrWs+039YclUdusK172jpgCT5moORzKAFUGfa6LTGLUjN+zHw8jS3Cy4ybkKs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnsTSBc9mS5YAOGY0w8pKPNx1vRGxLLEhZXG6vz7PFhJwUNTfn
	f1z6TgV1y/yAmmUTBnQennQcT1J/oQPATZbA/6rQJaqJ4xe4XmEuQdoZZ3dP7s0lKg==
X-Gm-Gg: AeBDievp3incClwyLLfR5NcqampsP5Ny8f6B07jAaX+OkVbxdGPv6ktPgv+8GDn1o7Z
	qy54iglCjxJvvafwQ5zPZncI7jB3Ut7MEF1baubtoFf8nwTmj+Lz/kGYVn3Sjm2Ioqiops2NbzH
	5bnwOcQdKa/qCDs3ph5RCiS14D5cfn5aG+Cgfom1T7lpzdp3qN5umR7jUsk3k0C5XAmHEYaW+BZ
	6nB4FOvGJkMrCv5v7CS+m6xWcElHrwgrrvOKf84ktF14XS4ukCOCRqYDewcewIXHmFVm6mWedAJ
	KISgPNEESwKB/SUq5Yrw31VcTs254QY/XhkKoUoAS9OxSNg/mNfVEv6sT9R0BwPMnHaRdjS9mub
	kh2avGAYEyqK0y2YBHmfTTFYJGzUPF/xuSPGUkztNbvI2wWmZhIMSvShHGgm0J46EYuruyGgIaP
	7JLIR7UcHExHIODSQdeoQ4KWvnkFEIgLtuUq+xZeRlQ4m8Lw==
X-Received: by 2002:a05:622a:1e14:b0:50e:6313:6e12 with SMTP id d75a77b69052e-51461bfe0d6mr6459061cf.16.1778008682531;
        Tue, 05 May 2026 12:18:02 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::a0bd])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51040b8550esm132885031cf.26.2026.05.05.12.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 12:18:01 -0700 (PDT)
Date: Tue, 5 May 2026 15:17:59 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Heitor Alves de Siqueira <halves@igalia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	Dave Penkler <dpenkler@gmail.com>, Johan Hovold <johan@kernel.org>,
	kernel-dev@igalia.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+abbfd103085885cf16a2@syzkaller.appspotmail.com,
	stable@kernel.org
Subject: Re: [PATCH v3 1/2] usb: usbtmc: check URB actual_length for
 interrupt-IN notifications
Message-ID: <fbbcf9c7-b1f6-45d9-bb69-6c9878d3f658@rowland.harvard.edu>
References: <20260505-usbtmc-iin-size-v3-0-a36113f62db7@igalia.com>
 <20260505-usbtmc-iin-size-v3-1-a36113f62db7@igalia.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505-usbtmc-iin-size-v3-1-a36113f62db7@igalia.com>
X-Rspamd-Queue-Id: 463924D3110
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FREEMAIL_CC(0.00)[linuxfoundation.org,gmail.com,kernel.org,igalia.com,vger.kernel.org,syzkaller.appspotmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36986-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,abbfd103085885cf16a2];
	TO_DN_SOME(0.00)[]

On Tue, May 05, 2026 at 03:56:03PM -0300, Heitor Alves de Siqueira wrote:
> USBTMC devices can use an optional interrupt endpoint for notification
> messages. These typically contain two-byte headers indicating the
> payload format, but the driver does not check if these headers are
> present before accessing the data buffers. In cases where the URB
> actual_length is not enough to fit these headers, the driver will either
> cause an out-of-bounds read, or consume stale leftover data from a
> previous notification.
> 
> Fix by checking if actual_data contains enough bytes for the headers,
> otherwise resubmit URB to the interrupt endpoint.

Would it be simpler to solve this by setting the two header bytes to 0 
before submitting the URB?  Then if the device did not send enough data, 
the header values would be 0, which should prevent any reads from being 
out-of-bounds or getting stale data.

Alan Stern

