Return-Path: <linux-usb+bounces-35092-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFBfB6dbu2lfjAIAu9opvQ
	(envelope-from <linux-usb+bounces-35092-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 03:12:55 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 743A02C4CC5
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 03:12:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF1743173076
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 02:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37BF6313293;
	Thu, 19 Mar 2026 02:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="tgkWiX+C"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF9F31F9B8
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 02:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773886071; cv=none; b=LU9vkziZk/hlYZV295RjvRcWSAGzfuQsmIBUpoG337IlHaGeqhJPZ186EYUwRYf2G42QrQOD8In56jaORNmPmRGWe9Hu+ADqfHE2k2xGIwvXrOqfSkEbJqcRmxrML2LMEOHazacye7D0RqvgGOaPWvfeyB2/jNRsjXfxkokFfu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773886071; c=relaxed/simple;
	bh=UxD4g3HbGfmY83n+3TIAVd6FWrGQQb5VUKGsEOdgvsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBrQZYokDhwyYu8F1bh3XwA8VnIs/zhpnlpLSfvl3CB3g25EZo6usOotOpNR2WcrLTNKBbrpXWxCdubszHnlQJXKPdrznAut063jNt5dFSdG7TxLbtBGnbsVlgsg8gpyeMWB15YqNHWcUvUf6/WRMmixr9DnxCxDq+yk450nDBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=tgkWiX+C; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8cd8a189f44so56560085a.0
        for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 19:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1773886069; x=1774490869; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=093bvmhelsZUfon288UTO6sBwmjWc42vgHQkAkAyczc=;
        b=tgkWiX+C9dYGH6hCcya2HU4IgO0wz7hvZOBZyffPZWavEQU8yPtIb6DnveUeCF16EZ
         40dYEC4HfnWoV+j0RFipsSFS1cuaChTdEBn0alBnHlkzyzDAnahVgNNEesSrt4w0MGnP
         zkMdiNsspRS3MTtU0f48rn7qdu8Qpeao9eNgMYkqtPCMF0675ZIua2npN3oX/ABZMcHf
         j+VhERpEQyGpgWFqVwYxoAavqLSsVc3k/jyhlfn1019Rk9MYTMX1XZ3RC0dwnIgsf/wk
         Mc/6wHBA78xPSqD2I3XigSbE7p2FqtHT/YT4xlgB1LjJ7/IbVqnwfWIwHZkqwc3iqonQ
         nMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773886069; x=1774490869;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=093bvmhelsZUfon288UTO6sBwmjWc42vgHQkAkAyczc=;
        b=itkap5abgVnAaDj1lENqPCCfTMTB/pkvnQ7FPOm+duv7gTXJwbVsi167stkQ6jnomS
         CwyIwW1U4o3a92LPQUkObXPd4XqX1AdRRHq3bLdMXJeb6+GvTeENqHE0XVTF0E6cR7OR
         E7+cIfeMshLYu00ClL+dLHaxlf3fZcJ/t+GuhjJwToQdq8VTANL1ACrgLnOe4kybUuJ3
         HN58zJd7JzG7DIS8fvp3xdg6p3YIKQaHZkl216jxLqZxv4UITQ52HmiIFPnpyLZ8KpWw
         XCX1jBHRCSDRVbrNxTgqrjaNFRn4AE0Pvr47NRbfUvrSi+MIjW/wPbYanLBkVL23FQFo
         Lc5g==
X-Forwarded-Encrypted: i=1; AJvYcCUoF8Cl7cb0x1QkXL0mQRF38U7P5RRDtp/aLfKnrBnG83n3sks9hROnMRczefOjbULbA3L0hXjYO+E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjntz8Jaxw8Zdq+dK5B0/vhFKqs1DNkMeSvF1cNJKEUmJN3K/P
	tiSxkHr0RKmW7zjG7Hl6KJB+MclTomYH0VtUKpe9Ts6bdXn/oC0qSbDiLVGDWyYzwA==
X-Gm-Gg: ATEYQzyl/+FT3uDsrGOUoFsUHbRLL/7Y3Wtb5NH45C0EETECOIPJE5uv3KWh5EpCike
	nL4Mjq6hxbr/pRTGZgbrVcreaRWEz0VlkHo2ryhfp6I1KK4yJfOYxjrUJMrcNaQyGnoT7TBrHog
	Zv3L7yVtsUXbPfEKr2U0bMUQLloNujApL+jRRuA3SyG0T8xZTMCwNJ+fFIVxOu2U9EwQ+WWb88e
	lybvuyJuUNxnQrzCiJmyUjSPSkDcWatoQZXsepgiGQl8kF7HEAWHfv1DB8YDDhwxdlHb6R4QhNt
	Pj5BexTiOibSyv9z4T0achxdgTIq6pSWGst2/T0xvs67nqPJxbF3MdM7O7G1J1xWAgLL686wB0u
	5rszTEtvt0SEDjoLfbDxEaNpFrbkfOcXVYeEOEc69uLUDxFPD4iJeA1cPcGSzUrWb9X4IPstjXA
	NRZC2NQM1xa3T9voCXduFIjvdW
X-Received: by 2002:a05:620a:4409:b0:8cd:7fc0:ee19 with SMTP id af79cd13be357-8cfad268f61mr771978285a.20.1773886069207;
        Wed, 18 Mar 2026 19:07:49 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::687c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfacdb12a9sm349017585a.7.2026.03.18.19.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 19:07:48 -0700 (PDT)
Date: Wed, 18 Mar 2026 22:07:44 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Michal Pecio <michal.pecio@gmail.com>, Oliver Neukum <oneukum@suse.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	USB list <linux-usb@vger.kernel.org>
Subject: Re: correctly handling EPROTO
Message-ID: <1eaf4cf3-4278-4d04-87aa-8b6069d544e1@rowland.harvard.edu>
References: <0b45d0e4-53f8-4960-b41c-63639b496dac@suse.com>
 <4f8b9942-307b-4c31-86f3-1b7b20b34a16@rowland.harvard.edu>
 <d1674f98-cbbf-4a16-8c76-996a0494d931@suse.com>
 <abcd2076-c2d4-403d-8ab8-af747b335075@rowland.harvard.edu>
 <87a692e2-559a-4765-8321-a422751d3589@suse.com>
 <4ada5d68-56f1-41b7-82d9-463901c927db@rowland.harvard.edu>
 <8a14fe29-0d92-4ce5-a7e2-2c084c710727@suse.com>
 <b0217cdc-f263-418c-b8b5-584520d0b1db@rowland.harvard.edu>
 <20260318223851.1f6d07d7.michal.pecio@gmail.com>
 <20260318235920.ioek26hdr25rkksp@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318235920.ioek26hdr25rkksp@synopsys.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,suse.com,mork.no,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	TAGGED_FROM(0.00)[bounces-35092-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.959];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 743A02C4CC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 11:59:21PM +0000, Thinh Nguyen wrote:
> On Wed, Mar 18, 2026, Michal Pecio wrote:
> > On Wed, 18 Mar 2026 13:46:26 -0400, Alan Stern wrote:
> > > On Wed, Mar 18, 2026 at 10:54:20AM +0100, Oliver Neukum wrote:
> > > > On 17.03.26 19:03, Alan Stern wrote:
> > > > > You know, with a USB-2 host controller, transaction errors don't
> > > > > make an endpoint unusable, and clear-halt isn't necessary.
> > 
> > Depends on what you mean by "usable". If you get EPROTO reading from
> > a Transaction Translator and the TT discards the packet (because of
> > timeout on Int or by explicit SW request on Bulk) then not only is the
> > particular packet lost because the device got its ACK and moved on, but
> > I suspect the next packet will be dropped too due to toggle mismatch.
> > 
> > Granted, EPROTO outside of disconnections is apparently rare enough
> > that a horde of users demanging this to be fixed hasn't materialized.
> 
> I've seen Windows drivers handling UAS transaction error recovery
> through clear-halt and retry SCSI command, and it works well. I hope to
> see this type of recovery implemented for usb storage and uas devices in
> the future.

I don't know about uas, but usb-storage handles transaction error 
recovery in approximately the same way.  A clear-halt is issued only if 
the device sent a halt token -- but that's not considered a transaction 
error.  Otherwise, for things like -EPROTO, usb-storage does a device 
reset and the SCSI command is retried.  Possibly skipping some initial 
portion of the data if the transfer was partially successful.  (This 
might not work very well for things like tape drives, but disk drives 
have the convenient feature that reads and writes are idempotent.)

> The retrying of the URB or sending a new set of URBs should be a
> decision by the class driver where synchronization at the higher
> protocol may be needed. An URB failed with -EPROTO may mean some
> previous successful transfers need to be discarded and retried also.

That's a good point.  There's only so much we can expect the core to 
handle.

> What we do know is that an -EPROTO means that the xhci endpoint state
> was halted, the xhci would need to reset (not soft retry) the endpoint
> before it can be used again. Since the bulk sequence is reset from reset
> ep command, we'd need clear-halt to synchronize with the device side.
> The reset ep command behavior (and when to use it) is xhci specific, so
> IMHO, it should the xhci driver to handle the clear-halt. Which URB(s)
> need to be retried should be a decision by the upperlayer drivers.

And for which drivers will we want to go to the trouble of adding this 
kind of error recovery?  Alternatives include doing just enough to make 
the endpoint start working again and ignoring any data loss, or 
declaring the whole device to be offline (which would need at least an 
unbind and maybe even a power cycle to recover from).

Alan Stern

