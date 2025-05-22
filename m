Return-Path: <linux-usb+bounces-24230-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 393C7AC0B99
	for <lists+linux-usb@lfdr.de>; Thu, 22 May 2025 14:30:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 506621BC4C1E
	for <lists+linux-usb@lfdr.de>; Thu, 22 May 2025 12:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5623B28A408;
	Thu, 22 May 2025 12:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wAEFq2XG"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6B728A3FC
	for <linux-usb@vger.kernel.org>; Thu, 22 May 2025 12:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747917009; cv=none; b=akloExXOsRN7bhqRbZ4nlcXFy5TrD/8VuJxmMNfQ3V00oR0UC9CgP1LYbNSz7HLaCmNBFWC6h6bpG3N0Vp0fs3RctLm47oaAAmH41wZr59UqiNacwsQpxBeYdPyhPfUvF1v813aVMjKjxx+FVgz3Qa6XSgSUeQ9NIz0QVBQzsL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747917009; c=relaxed/simple;
	bh=MZS1CgAHjzbdMj2ymiyL2y3V6Vusz2/D2/Dle1BDaNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fwwT5sk/nN6BkNPf15HCUldNn44kjdf1GV04FuwqpBmnptOW3+XWVWYkGTNT6367Le9b/P1iYXCo385WgQJ5QS5ZLMCUvxvvYFbZAQvPj4MEnvGEhYrMRYBjvwxD7aDLz04lXMP2Wu/6KcdHZw6ejEphqOMqjiF7xgBTgS00dpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wAEFq2XG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A35ADC4CEE4;
	Thu, 22 May 2025 12:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747917009;
	bh=MZS1CgAHjzbdMj2ymiyL2y3V6Vusz2/D2/Dle1BDaNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wAEFq2XGWOAm7b5DnuwKjy+iTtrr1KT19fk0//h2rkFOBUXTrK2gP55RDGHKclfwI
	 Fe9ue0a8LcQpXCg22Xtka4iOrFXDRJ4NzllZKiUZHRJB+U7he+hnXP2oIBFE1kzj4m
	 pgL4p9ZeCDEz5kqs/AKLPwLcEqJ7Gjl1taSS1nKY=
Date: Thu, 22 May 2025 14:30:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: typec: fix const issue in typec_match()
Message-ID: <2025052244-mockup-dreadlock-bb3e@gregkh>
References: <2025052126-scholar-stainless-ad55@gregkh>
 <aC8TH03vOhXI9IYW@kuha.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aC8TH03vOhXI9IYW@kuha.fi.intel.com>

On Thu, May 22, 2025 at 03:05:51PM +0300, Heikki Krogerus wrote:
> Hi Greg,
> 
> On Wed, May 21, 2025 at 03:41:27PM +0200, Greg Kroah-Hartman wrote:
> > typec_match() takes a const pointer, and then decides to cast it away
> > into a non-const one, which is not a good thing to do overall.  Fix this
> > up by properly setting the pointers to be const to preserve that
> > attribute.
> > 
> > Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> Shouldn't there be a Fixes tag? git blame gives commit d69d804845985

Yes, as Johan pointed out, this is my fault :)  I'll add that when I
commit this.

> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

thanks for the review!

greg k-h

