Return-Path: <linux-usb+bounces-35244-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLuHLV0avWnG6QIAu9opvQ
	(envelope-from <linux-usb+bounces-35244-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 10:58:53 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 248382D8618
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 10:58:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D0B75301D300
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 09:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9357D38AC6C;
	Fri, 20 Mar 2026 09:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFFjVJdu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD07638A719
	for <linux-usb@vger.kernel.org>; Fri, 20 Mar 2026 09:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774000728; cv=none; b=eRZxvdaOfWMT2d82OLZciXFYGlMsWWE9qZqb9sRn7uyK99q6qtB3siOXkISy/fj2xxmbgDLAJy76ezqqfldBzMNNUa6NdYob71HqZYOdgvcwrxTpizCthqsCmHfi97nLIyIQA8C/8qivfvLgIst01w/EfTqirjQLAINqLLAD1SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774000728; c=relaxed/simple;
	bh=LnZEy3yCGFjU93nGA1YFlg5LFDNjDSr+WRxn6xuzeGs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=neMakODrleFl/sJ5STQbOf88+0Jb0iwwbYJGMF3fv17wi5yjiotfa34eKhHISxkEYL7y5W6Y0zasPPHe+FKpmOxhojUp6yyXvlKE4nyzER/3gtiVvfucPrxm6L1SrG97RuSarw/kZfwGf9x43IzbQMnOFBAm9r2g7wO116/nNfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lFFjVJdu; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b980b35534eso326099366b.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Mar 2026 02:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774000725; x=1774605525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FyTrEH13XjFSeyl+eHQkMedp7n96+gaoANoGWLli3xM=;
        b=lFFjVJdu5hwSoRG9FwcAAOWNKxuw80APIVSg8F3t6odhxbFazdyiukzPel76Srwvil
         6wr+QF8nELKbmDF2qR76+trUoDfcxsWgU1eqJPcKixJEZtk1uDapQ1S23YWjHbWKoNeE
         JeWn+gxVqvshopt0IebQxbdKANRmbIBsWeivzaDbauNSxmAvCVQiyixj4VgLRBgp6LWr
         Qo/rjs5DAFIwdpB//VyaTrim9rZ5L5Yp5K4ErVAOGZxgCUCiWw5qn1/yzubXJDpk0Rem
         U6rbJqSMHsJcxBEcEuKT7waLtIUGCxzD+kwRB7gfU2TFEGmQDR1qBeE58VMI66Wv20L1
         ra3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774000725; x=1774605525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FyTrEH13XjFSeyl+eHQkMedp7n96+gaoANoGWLli3xM=;
        b=bMnU3xbC8QQxWsqUo/A51bI47vEQfe7q8mum5DjR5cK2DLL/d+cDeaa3VCNXZcx4on
         LtccXt6tyAA3JAIijA0vr2QK83sdjvdG27n4rJGcGFFNRGpdNqBPPCJTrNHNEamYUSG0
         K23yMoDM5jSZVuix5jCYodGk7CMG0gW7U/+RQNQ9uN7G1w989UgUP4jx27L+42ICa+I3
         v+ku0ojNWS60+dhvOyZLwr5dhTdCM6J/K4Y5egdFnIjqYqABoCsgu8mmaGmOQy+GAByQ
         7VGXDVWdbwkIJMPp3R8JHUH1BzHLhAMHRV0i85pGHLurTCRj0XfiPObziu096WbSAXE9
         VCCA==
X-Forwarded-Encrypted: i=1; AJvYcCWOzzNIo1ggaC+uPv8nKEyUTmVe8H4rLR8L0R6XXtEopuT82ZDc3TrqW7IpIrYx0IIEznHBEFKQjBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxhutDh0Tzk6ffTiEHw7y67EwmugQo93qLsIM5VxCVTySvX1/f
	AzsVnRN/nlWGdMe3RwJra+Z7eONfi4mh3Dp4rKM/iV6olegey+ORJnoo
X-Gm-Gg: ATEYQzwqi8TAhAXasCpLmJ2Ojrvd4BCGje2g76Ze3AiFnopg7Jk6zOIiS07kcYVUzi+
	tpthXtKjVrCsES3C16cZnDas1AMz5dogpOOD/+/ax4oWpCFl6B9BAoRKBc+hamLdkRzW6HPbJRN
	Rqlgg/ltVlOFN3XmHvar2KJmBsA+dw1KYKT0o+bi8Hcp5gLuk8fbS6Yk3u3j24COYDLWseESuii
	y/jO9mOu9e08Bh7XZhUgZ3+8ffozfk7fDQ/Bd4TIm6Obpzn5hwzqGsJzQ+QOEJ7bU2EnS0SiG0p
	C+B8XViVQt7LJHqlaAtGySJri02XgWNFx6KqApZJ/oV193/gnuacDvvvzVV4lEvCv8zrD9Ikt8h
	bXThSqk7ED9Csr7tuGfAdrwYan+JOOB5lsvVBnSut87Nu9XWe4ZviltWPt3N+YW2izb1LOysV6T
	REe9UAsxgJn6M0tKm9o5vCAWl0g6rr9DWBi4w=
X-Received: by 2002:a17:907:e10c:b0:b97:81a1:9f38 with SMTP id a640c23a62f3a-b982f58d9d2mr93918666b.16.1774000724915;
        Fri, 20 Mar 2026 02:58:44 -0700 (PDT)
Received: from foxbook (bfk214.neoplus.adsl.tpnet.pl. [83.28.48.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f43a65sm134841466b.7.2026.03.20.02.58.43
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 20 Mar 2026 02:58:44 -0700 (PDT)
Date: Fri, 20 Mar 2026 10:58:38 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, Oliver Neukum
 <oneukum@suse.com>, =?UTF-8?B?QmrDuHJu?= Mork <bjorn@mork.no>, USB list
 <linux-usb@vger.kernel.org>
Subject: Re: correctly handling EPROTO
Message-ID: <20260320105838.2eaebfe5.michal.pecio@gmail.com>
In-Reply-To: <20260319231620.3ukqxsrwqikp5zbd@synopsys.com>
References: <4f8b9942-307b-4c31-86f3-1b7b20b34a16@rowland.harvard.edu>
	<d1674f98-cbbf-4a16-8c76-996a0494d931@suse.com>
	<abcd2076-c2d4-403d-8ab8-af747b335075@rowland.harvard.edu>
	<87a692e2-559a-4765-8321-a422751d3589@suse.com>
	<4ada5d68-56f1-41b7-82d9-463901c927db@rowland.harvard.edu>
	<8a14fe29-0d92-4ce5-a7e2-2c084c710727@suse.com>
	<b0217cdc-f263-418c-b8b5-584520d0b1db@rowland.harvard.edu>
	<20260318223851.1f6d07d7.michal.pecio@gmail.com>
	<20260318235920.ioek26hdr25rkksp@synopsys.com>
	<1eaf4cf3-4278-4d04-87aa-8b6069d544e1@rowland.harvard.edu>
	<20260319231620.3ukqxsrwqikp5zbd@synopsys.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35244-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.977];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 248382D8618
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 19 Mar 2026 23:16:22 +0000, Thinh Nguyen wrote:
> On Wed, Mar 18, 2026, Alan Stern wrote:
> > I don't know about uas, but usb-storage handles transaction error 
> > recovery in approximately the same way.  A clear-halt is issued
> > only if the device sent a halt token -- but that's not considered a
> > transaction error.
> 
> That's -EPIPE right? With this, the storage driver knows that it
> needs to perform clear-halt because the bulk endpoint is STALL, not
> -EPROTO.

To be exact, EPIPE only means that the host got STALL handshake, but
not that the device originated it. Our good friend TT rendponds with
STALL after Bulk/Control transaction error on the downstream bus.
Similar error on Int produces a distinct ERR handshake. Don't ask me.

On IN endpoint both sides agree that the transaction didn't happen.
On OUT the device may have accepted the data (figure A-14). If you
mindlessly clear halt and resubmit it will accept same data again.

Some HCDs also report ETIME and EILSEQ, supposedly similar to EPROTO.

On xhci-hcd there is no ETIME, and EILSEQ means that the HW considers
our "transfer descriptors" ill formed. We don't bother unlocking the
endpoint, as retrying seems futile. No reports in at least two years.
Maybe other status would be more appropriate? But nobody complains.

> > Otherwise, for things like -EPROTO, usb-storage does a device reset
> > and the SCSI command is retried.  Possibly skipping some initial   
> 
> The recovery I'm thinking of doesn't involve a port reset. A port
> reset is very disruptive and will impact performance greatly. I'm
> referring to an intermediate recovery step at the usb storage driver
> without delegating to the SCSI layer.

Device reset is slow no doubt, but it may be the reason why there are
no users screaming about filesystem corruption despite the apparent
widespread neglect of TT corner cases and xhci-hcd bugs.

UAS is another can of worms, for example xHCI seems to require a
guarantee that a stream is inactive in the device (by class specific
means) before its URBs can be unlinked. See 4.6.10, 4.12.

> What I'd like to see is that the endpoint can be put in a state where
> the class driver can submit a new URB without unbind/reset/power
> cycle. With the current implementation of the xhci driver, we cannot
> do that for bulk endpoints with -EPROTO error.

It can already be done with usb_clear_halt() and this should generally
work for drivers which don't queue multiple URBs in advance (those are
subject to race conditions due to BH giveback, and to xhci-hcd bugs).

Double delivery is possible on retries after usb_clear_halt(). Probably
less likely at SuperSpeed (32 instead of 2 sequence states).

If you don't reset the pipe then xhci-hcd resets one end of it behind
your back. I could write a test patch which changes this behavior for
people to play with, but you seemed skeptical.

Alternatively, URB API would need changes to support xHCI native retry.

As you work for an xHCI IP vendor, do you know something we don't? ;)
It seems to me (and Mathias apparently too) that Reset Endpoint with
TSP followed by Set TR Dequeue would trick HW into retrying the failed
USB transaction with the data buffer of the new or resubmitted URB.

Except of course if TTs are involved. Retrying transactions involving
those is "undefined behavior" per xHCI spec. I suspect that even
ehci-hcd may not support retry by resubmission in such cases properly.

Regards,
Michal

