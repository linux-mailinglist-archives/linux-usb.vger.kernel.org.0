Return-Path: <linux-usb+bounces-9127-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B6E89D858
	for <lists+linux-usb@lfdr.de>; Tue,  9 Apr 2024 13:45:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77FBE1F20C92
	for <lists+linux-usb@lfdr.de>; Tue,  9 Apr 2024 11:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F22127B4E;
	Tue,  9 Apr 2024 11:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="W2Sxueu5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA13480629
	for <linux-usb@vger.kernel.org>; Tue,  9 Apr 2024 11:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712663130; cv=none; b=CVBZRWHlM8twgycUepNd26bQJxWETI8J5T8nRbV9hrJHgt1BJrGX0S2COsXxHGHeQm1axGo+taMJnbLfqUfDJvLkiNjDiuJwHCp7R4qK5R6GZtmdaP89LTz36bxyy0E4yoNSysOtcJoRiR/oGZX1WU/Rmgo5q5e4Ur6pOH73JTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712663130; c=relaxed/simple;
	bh=7xKBSw9MuAkc7Gs2EUafsPctWa8JmHcxhJkxS4r4fmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VBGa9BoEDNyXnzeLIqKVW9oQSyTwczYrZfkL2EuOiTd4kaUbfhMDjOL9Yu+4ct+Z+MrYjNdVqqhWu+FppefT+tNHdjGBCEGhL0rqJyG6SMaS12QA6heIQEnBuICm5tONr7PzbPFl6uYXRNDttusOUHSvpb/UTyK5nQMerVFECTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=W2Sxueu5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3BA0C433F1;
	Tue,  9 Apr 2024 11:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1712663130;
	bh=7xKBSw9MuAkc7Gs2EUafsPctWa8JmHcxhJkxS4r4fmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W2Sxueu5kob43OvX33nI0jpMTss8ROzeBlR76OOKr6Uoy+2jhJNrjqR7lziY3+vKH
	 c2kT45VQfKRRFUmJ3lFLNkEYRs6I0NpsLPpakZf0ZvhxIWwOzuuhcJsuqoAdgNunRA
	 ywS4nZj4m/91ZVHhMAR+WS6Su68M/93WVq+t5vbI=
Date: Tue, 9 Apr 2024 13:45:27 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH] usb: dwc2: host: Fix dereference issue in DDMA
 completion flow.
Message-ID: <2024040912-dismantle-reward-9057@gregkh>
References: <30794381684043b7083bb873d82b012254e033f5.1712656793.git.Minas.Harutyunyan@synopsys.com>
 <2024040936-dosage-marrow-c1d6@gregkh>
 <5a9376a4-d60d-1c27-4a41-5796000bd023@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a9376a4-d60d-1c27-4a41-5796000bd023@synopsys.com>

On Tue, Apr 09, 2024 at 11:39:00AM +0000, Minas Harutyunyan wrote:
> Hi Greg,
> 
> On 4/9/24 14:10, Greg Kroah-Hartman wrote:
> > On Tue, Apr 09, 2024 at 10:06:32AM +0000, Minas Harutyunyan wrote:
> >> Fixed variable dereference issue in DDMA completion flow.
> > 
> > What do you mean by this?
> > 
> >>
> >> Fixes: b258e4268850 ("usb: dwc2: host: Fix ISOC flow in DDMA mode")
> >> CC: stable@vger.kernel.org
> >> Signed-off-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
> > 
> > Did someone report this problem?
> > 
> > thanks,
> > 
> > greg k-h
> > 
> 
> Yes, it's reported by Dan Carpenter:

Then please use the proper "Reported-by:" line.

thanks,

greg k-h

