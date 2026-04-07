Return-Path: <linux-usb+bounces-36052-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNw9Mksl1WnK1AcAu9opvQ
	(envelope-from <linux-usb+bounces-36052-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 17:39:55 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C01783B1255
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 17:39:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 437BC3094522
	for <lists+linux-usb@lfdr.de>; Tue,  7 Apr 2026 15:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 885B4396579;
	Tue,  7 Apr 2026 15:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="FIsayPh6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B423C063F
	for <linux-usb@vger.kernel.org>; Tue,  7 Apr 2026 15:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775575423; cv=none; b=YGXJbEES7Rbog0aNczYnG4Y1xqcSzP40EE2J5jVXI/1o6qbf12klgb/CmOtrHmRwB5gHb1jnOJ3rxUfhM1De5VVZnmQZ/kN8mrJWtL2ioLLHtSg4pnlRX75B960eVWxCbwDl7r6g6QOQjHl6ZsJrD8fN5YKms1nefGVO1khf2io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775575423; c=relaxed/simple;
	bh=uZCPqT4eo/Phm4Ef1s+KivZw6mSw7IY0BQdFv7M+RHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s850YL+DtsoqHjnonDWXCXQODv6hIttTa5qDS+gW/SzsZ09cbtf3fByDfHHQ+zfXD3Ns+hf1UBs8ScgB8suWz3PH6CjbpE2rXafnLlVPtl5UUFIhnIK46NERT08jMQ656ltzJNELbUYqzcRwtNzKNC/ESBQmb8i8A5fkrUDRTmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=FIsayPh6; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-50d6249bb99so39389761cf.0
        for <linux-usb@vger.kernel.org>; Tue, 07 Apr 2026 08:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1775575416; x=1776180216; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KdL5Ny94TZ23pfkK8GZeBEU3xjDq/j+JCv1FsNsV4jw=;
        b=FIsayPh6RDjp76N/g1B76meMf9h2+n6y9dFIlRa5Qb51Rf/L5PQmDF8ozG0KJ4V8ng
         QkO/I8NqtsQPVa+9Nn1H2s8mQVdh7M9vwMCGbqQsfLdKuqME5cD5voww6y9UTyJj2EY4
         KE4uoJXTh92/eA/0v4hMU+pIcpeGNM5zOM0nHHKbJolCEoS0J2p3xspabmaLekluLMAb
         UK3H95EVWPchvNRxPb33FuvDO2fkUpM6YDBjMUQqFyOp1rhpIP6yIJuECeEvxqmUeb+h
         gwJ3sgsGbkkk0ACHXUsFUSHRxIbJlkAJzO6GEWSZVqcjiGRAk/tT40+M4HyCqzQkSDz9
         u2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775575416; x=1776180216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KdL5Ny94TZ23pfkK8GZeBEU3xjDq/j+JCv1FsNsV4jw=;
        b=hVX9+exuYwrvxittT0GRfDiAHKCx5UOtUKC0n9VuBJCy3THdsjZzfn0SEmccujzGYe
         rRzyFbL25ffnGNsA+oH3WKXk4Wuh21pdPhkXaIwF1xJ81XTf6CrcP1j7HBllAz7pjCa5
         3GBA6WlIC+SCnV5V7y8cU6UBOvmcSZ6cidtJeFBJ8QwDIe85ht8m5fu0NpkoXX0QWol1
         IDyeUIAUEbxFMoWXXgn7SPR84sIpk+8pwsqZk3/KfbJYCYZFJx2Xox2GZPR7pKE7DRpC
         Z3mxcExU8yTNFpS6ndUaQooc8ui2IrJH43XtmNVcslcObdRbePNq5CLWEWOjQ61lUAZR
         fD5g==
X-Forwarded-Encrypted: i=1; AJvYcCVz9SMJcMKcOYntO4fBwI02yRtcorr4BWqM1jXiJRbCGjEIwgmifeOMzbp9q0olINRq7oXcSGySExg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKkttg3MXigGHHZ/GNCYGIpEsBWOobbk9LKjLnNr12khWQfOWD
	RCyTjRLbiHltpY/emhB2CTFU7DRGx4mbnW8AvdJhi1DP3y/ocpapSmZAabx3aqaNQQ==
X-Gm-Gg: AeBDievRY3bBt+eat5wag6hWCO9rs0XC+Jo4gox6LbGP0L5xmazrKtwzBVakAvTXF0y
	BOfIHcl0jRNjw4Bpb+EN/FNKMZBuPqYASTV2jRlsS6cvWeVquH0NvNkwg58noEy7XZvtJDE4uTi
	SFpQ1NuyL6DfU8JX3R9ckvVn07i5jdj20Yx0Db11M7+tr94Qx0dCBxkjU8lPEfFyt48RbZyweTS
	yg/SRJGJho2AYD4IuoBPsBnLgXN0JaIVzbMJGI/dr9wz7SPz/5+DTS1BBJlMxxb6uGRarUEWQvb
	Hs/kCUAlTWxCWL4p1Xw8116txgUuLdy414a9/aG9L1F1hZpaqYGu9fbEEhnomDO/7dBS2fRQU6f
	ipOKrxDBXcQ8hFSdeT1ou34k3uTebBL8TNfpeTU+kXDQi8e0O6w1Crz+4xziFiR01mwPbIXuoui
	96pHAm5turrgmXleuSw3norHvC
X-Received: by 2002:a05:622a:3:b0:50b:2876:586 with SMTP id d75a77b69052e-50d62b51055mr263036721cf.5.1775575415719;
        Tue, 07 Apr 2026 08:23:35 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::5a82])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a5971ef80csm145168556d6.40.2026.04.07.08.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 08:23:35 -0700 (PDT)
Date: Tue, 7 Apr 2026 11:23:31 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"michal.pecio@gmail.com" <michal.pecio@gmail.com>,
	"oneukum@suse.com" <oneukum@suse.com>,
	"niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Message-ID: <74ac9ea2-34d1-4999-9048-c03a0f978b5d@rowland.harvard.edu>
References: <20260403015950.lx4n4zdqki37dy27@synopsys.com>
 <28a00143-85fa-4043-93a0-c2b687ff1bcd@rowland.harvard.edu>
 <20260404011530.aukxllvizvmc3f3x@synopsys.com>
 <616e2a64-6feb-4ee6-bf39-a6284549f18f@rowland.harvard.edu>
 <20260404204133.3mcizeeokw3ln5r4@synopsys.com>
 <243af5f2-3925-4960-be7b-8d0c273ae629@rowland.harvard.edu>
 <20260404221533.woepax7jxwefy3fq@synopsys.com>
 <20260404222818.t5y52gnd2gvalvp5@synopsys.com>
 <b4e2edd9-2616-4cfe-90a5-438fb6625706@rowland.harvard.edu>
 <20260405030954.32jbg3fphi5xdla3@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405030954.32jbg3fphi5xdla3@synopsys.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,gmail.com,suse.com];
	TAGGED_FROM(0.00)[bounces-36052-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,rowland.harvard.edu:dkim,rowland.harvard.edu:mid]
X-Rspamd-Queue-Id: C01783B1255
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It's been a while now, and nobody has objected to the proposed plan for 
handling this issue, so I'm going to assume that everyone is on board 
with the idea.

There is a loose end still to be straightened out.  It concerns handling 
of -EREMOTEIO errors (short packet received with URB_SHORT_NOT_OK set).  
While some HCDs -- especially those supporting SG -- may not stop the 
endpoint queue when this error occurs, other HCDs will do so.  The 
question is how the core should tell them to start it up again.  This 
shouldn't happen until after the completion handler returns.

Short packets don't cause any loss of synchronization between the 
endpoint state on the host and on the device, so -EREMOTEIO doesn't 
require usb_clear_halt() or usb_reset_endpoint() for recovery.  This 
means we need to find some other way to tell the HCD when the queue can 
restart.  Should we create a new hc_driver callback specifically for 
this purpose?

Related question: Although URB_SHORT_NOT_OK is allowed for all types of 
IN URB other than isochronous, does its queue-stopping property make 
sense for control or interrupt URBs?  As far as I know, no kernel code 
uses it for them, although some userspace code might (via usbfs).

Alan Stern

