Return-Path: <linux-usb+bounces-36424-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOPUBcvr6Gl4RgIAu9opvQ
	(envelope-from <linux-usb+bounces-36424-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 17:39:55 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7190F447FEC
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 17:39:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F00B3032986
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 15:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A5E6340293;
	Wed, 22 Apr 2026 15:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ogVp2v7o"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86986345CCE
	for <linux-usb@vger.kernel.org>; Wed, 22 Apr 2026 15:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776872149; cv=none; b=kewky7TivYDDGIBlTICbzRAoF2OTKnFzNNSOQEC5IUciABzo1I+uVitdWM/cPgRitlLfW8EJqurBCALpGAGY/Hc20SB08zrQ//nBW6nC8H+hnZxSYW+hrMNdw31e7DHPCklvCxgB+nk4T26QUFIpCjPPRDnPtWjaOIsbBKj+60Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776872149; c=relaxed/simple;
	bh=vGrdmRdn4nAl0WpcnXoVykDnTnzwMG1K9xQy4vqFJ3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P91cxIRnOqCPzlElTGrARkC9ZE1MSe9nDv305A0Gje+G41TeKXW1Ilhl6sy4EXIFUENzfNF20MvUH5gcvGLKBLvJhZx/Dv1Pigdm1gVAeFxMoNKLmAXihycqPfKbIZaoJfJmpUrzVrXksTUjeYLSPAK1iiRPf1/DbNZGdlj7u7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ogVp2v7o; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8acb09ddbf6so80133586d6.2
        for <linux-usb@vger.kernel.org>; Wed, 22 Apr 2026 08:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1776872146; x=1777476946; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pQKUgrY2iA9H6zHnkb6AzQDK1yuwhYoTX1nS3ML0hFE=;
        b=ogVp2v7ol9xj3OTEAVaQiDSTAmWXz/6OW7nAk3VzVc9wLMPhpspnK/7wnXv8o/2ve4
         oGhE2yz1ABVT2jhMXixhX6Oib74hapD0S/Joe38HqcgeKU11Pf9kI253CBSXSo0TpjAi
         +4tFyIlvTROSXP20sw5F1tzJ3XPuSW8dmU2W4+Z4AjyvTw8osACYlgnsNnxFb0jsmsO7
         d2rbz8bWeYUjEkd2K1ACQ2HXo3sUYFpiEJXNCw/rieSRuP1hEMVQ1LBkSiGviqEGZnUh
         Zmod3Cv8m12F9jHD3WpyBRVONd3XQ/WUrFGtpu5tsnLvX6Kf1ELLksZrYyxLCHHG5YJe
         FqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776872146; x=1777476946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pQKUgrY2iA9H6zHnkb6AzQDK1yuwhYoTX1nS3ML0hFE=;
        b=DH6UNuhsZWOvRnHUP/4Lg9XlCWVGQegmmMXR+Nb75gWUjV+XSeEcwJB2ogFGz1Iu5z
         Xn6zZIMJEWL2Ndd1dM7vM5p9uRqLYCmz+/3VCi4jRsVE6JTt/aH2q/w0x1RgEyTXXbdE
         w95ZFEEYWo+C6MhART9L240OfSSEnhscgsJ83RX64f+cnUJgMkYJTvjC3jipy0w/s/qK
         dKdO3cX1zPNsVib5y8S0lQyOjPE0GxdQQA0egcQNG3CPOw75kZ3XKvVXv2eWN+xDwYW5
         W1gdaModwG0WsjCct66JWbvrKKMcQXcQk1FoxYhO33UYq0dMnU6Zebhaaiz4F8FZiPxv
         +WXw==
X-Forwarded-Encrypted: i=1; AFNElJ9ekY3swLDCDnw7TeiW8hTPuntBOVvwprXq3GRyWXldUXke4u6l6ZIVmjZLp44TsNeGx49hRQQ98tM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsVvfwRZxjq0kGNbPrmjXuHV14RzUuTQuY2ETzuSEnRvOlTdHu
	fMAg4u9h7Fqux3YL2Qc9J/Je8voLwEoiNr9Fs7gFovYRHrqXxpt5IF/cxuZ85VA4dg==
X-Gm-Gg: AeBDievkV+qEddkvzNN0H+zbBbUx/ErijzTfYUCPLg+3gRxQ8qEW2hily6/7xIyYuSP
	Cp+ihoLpePgZ/11fjY5qidJS6rc1COgedCFSp+NN0A19/zOq002hfUE09fpAJ1FqJUEpEWXGfW4
	xak8qveY2IpoucGlYTjEKA1bpFSpyUQUL+K1xtPYmAqHForD9LY9DUGTAOwqPddE3ZOTWbPk8Fv
	y8GmkBUqZLlcnmU8+XC/IBmrZziTjpuY9Mi5YoCgYhX8YE4TFfdYyHAphYfYjEIMNdypatXCZ+/
	S7EvID0drck32Uek+nngevoRbmF8lmqIwBWhqZY4TdgQc3AlOO5QcVjYdieB7sK+cStaiT5ZJvF
	B76N1uRSCkAYtDKbRTCGIRrNacqWIoOV2TZ3MvzyYFMawciFSR8BQYk9yxpVnuviMTZyfU+C7rT
	+RYnKV78ra6VPhHHh4w9e95h4qUYdsOHBAX+zT3Ti8r+fh49bkNEKJ
X-Received: by 2002:ad4:5aee:0:b0:8ac:a757:c1ef with SMTP id 6a1803df08f44-8b027ebe48emr383717586d6.0.1776872146080;
        Wed, 22 Apr 2026 08:35:46 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae79733sm133814206d6.33.2026.04.22.08.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 08:35:45 -0700 (PDT)
Date: Wed, 22 Apr 2026 11:35:42 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Michal Pecio <michal.pecio@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"oneukum@suse.com" <oneukum@suse.com>,
	"niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Message-ID: <143b5a40-4ad3-4ec2-b061-bc083635542b@rowland.harvard.edu>
References: <243af5f2-3925-4960-be7b-8d0c273ae629@rowland.harvard.edu>
 <20260404221533.woepax7jxwefy3fq@synopsys.com>
 <20260404222818.t5y52gnd2gvalvp5@synopsys.com>
 <b4e2edd9-2616-4cfe-90a5-438fb6625706@rowland.harvard.edu>
 <20260405030954.32jbg3fphi5xdla3@synopsys.com>
 <74ac9ea2-34d1-4999-9048-c03a0f978b5d@rowland.harvard.edu>
 <65682e07-e18c-4674-bfa7-2cc27abb5ede@linux.intel.com>
 <54fd265d-4ae8-4573-b618-587af98176c9@rowland.harvard.edu>
 <20260422073054.0bd482ba.michal.pecio@gmail.com>
 <e06dcae8-5b8e-4e58-a0cc-1c67e5a08170@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e06dcae8-5b8e-4e58-a0cc-1c67e5a08170@linux.intel.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,synopsys.com,vger.kernel.org,suse.com,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-36424-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rowland.harvard.edu:dkim,rowland.harvard.edu:mid]
X-Rspamd-Queue-Id: 7190F447FEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 04:51:30PM +0300, Mathias Nyman wrote:
> On 4/22/26 08:30, Michal Pecio wrote:
> > On Tue, 21 Apr 2026 22:11:41 -0400, Alan Stern wrote:
> > > Can you confirm that it's also possible for xhci-hcd to prevent
> > > control endpoints from restarting when a transaction error (-EPROTO)
> > > occurs?  Up until usb_reset_endpoint() or a new callback?
> > 
> > Doable. They halt like any other and it's SW's choice how to restart.
> 
> Yes, doable.
> 
> Would this be used in cases where all hope is lost and we want to reset the
> device, canceling all pending control URBs before restarting the ring,
> thus avoiding sending any extra URBs to the device just to wait for
> them to fail or timeout?

That wasn't my intention.  The purpose was to avoid getting into a tight 
loop such as in fuzzing tests with dummy-hcd.  When a device is 
disconnected, if the class driver's completion handler immediately 
resubmits after a -EPROTO error, and the resubmitted URB immediately 
fails with -EPROTO status, the resulting loop can use enough of a CPU's 
time to cause a "CPU hung" error.

The same sort of thing can happen with real host controllers, although 
the loop won't be quite so tight.  But if we prevent resubmitted URBs 
from failing until the endpoint is reset or restarted, that will slow 
down the loop a lot.  Especially with a series of increasing delays 
between the restarts.

> In most cases I can think of it would make sense to keep the control endpoint
> running. Just let the hcd move to the SETUP stage of the next control transfer
> URB and continue.

I'd be in favor of that except for this tight-loop problem.

> For example EMF causing transaction error (-EPROTO) on active IN and OUT bulk
> transfers. Two clear-halt requests are queued, one for each endpoint.
> If first clear-halt request fails with -EPROTO  we still want to continue with
> the next request.

Actually no, we don't.  If the first clear-halt request fails, it means 
the EMF is still present.  We want to wait for a short time before 
sending the next request.  If we don't, and the next request gets sent 
right away, it will probably fail also.

> Shouldn't be any toggle/seq-nr issues here on the control endpoint.

Indeed.

> Most control transfer STALL (EPIPE) cases are protocol stalls, and we should
> just continue running. Exception here might be a STALL response
> to a clear-halt request. I assume (didn't check) device must support those.
> So in that case we may want to reset the device.

As I said to Michal, we can treat this the same as a transaction error: 
delay and retry, then eventually reset if needed.

In theory there's a risk of racing with a Set-Interface or Set-Config 
request, so that the clear-halt refers to an endpoint that doesn't exist 
any more.  This race can be prevented by making usb_set_interface() and 
usb_set_configuration() wait until all pending error recovery is done.

> There's also a risk that the control endpoint isn't started when it should.
> For example class driver could potentially call usb_clear_halt() on the control
> endpoint, synchronously waiting  for the clear-halt request to complete before
> calling usb_reset_endpoint(). If endpoint restarts at usb_reset_endpoint() then
> the clear-halt control transfer would time out.

You're suggesting that the clear-halt request might not be sent to the 
device (and would therefore time out) because the endpoint queue isn't 
running, and it won't start running until usb_reset_endpoint() is 
called?  That objection applies only to ep0.  Other control endpoints 
don't have this problem because the clear-halt request is always sent to 
ep0.

ep0 is a special case.  If it ever does halt in such an extreme fashion 
that it can't even accept SETUP packets then there's no way to 
communicate with it at all.  The USB 2.0 spec mentions this possibility 
in section 5.5.5; it says the only way to recover is then to reset the 
device.  There should never be any reason to send a clear-halt request 
for ep0.

Alan Stern

