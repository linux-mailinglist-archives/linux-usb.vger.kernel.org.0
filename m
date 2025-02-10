Return-Path: <linux-usb+bounces-20371-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB7AA2E40D
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2025 07:13:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B05F0188861A
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2025 06:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46ED7192B76;
	Mon, 10 Feb 2025 06:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BPaJUdtI"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A012F2E
	for <linux-usb@vger.kernel.org>; Mon, 10 Feb 2025 06:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739167984; cv=none; b=ulPMpdaXWOM0IKXd8gjGVvSg2M6TNMRHFo85xamYO09ouFLJ6QE4NijDW0djdTh60e38nVvRYFaf2lH7pAdpFizLNzY2pyNGS55W7+V57eLFZmi7lqfiYQ9a8ZpjAwtXqI4reOSXZwsWh+V1jvYLt/GLqt2d9jLjBcZXCKBgnDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739167984; c=relaxed/simple;
	bh=MQGuafPqiC2cZmwZBNDFLmtgY8mwPFo7e+rI7vBoFGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VcQ8lEM8V8fLUsAolGNGvKpoGAod2QkDwXouennhBOY3WswMuIl9LZz/4ao1/9AjcB2zaTX9l2eWyQTMlexpHD71bOQneYuy312FgeHkB38/r6tNXAQdBMxPO4K9a52sPxuqaciLvs3bPDA09E8qSTeWCqJNcPhozxvQktBDl34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BPaJUdtI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8521C4CED1;
	Mon, 10 Feb 2025 06:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739167984;
	bh=MQGuafPqiC2cZmwZBNDFLmtgY8mwPFo7e+rI7vBoFGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BPaJUdtIRUj6hohvHPWF96kD8hCIsKHbhsnxE/ji6Gyd9+GFz42E4E9N+gLxksW+L
	 o57jqYXMy07vuVrVUjCnz8EH5Kzps5P9bBkws9cNBbsLXUfi1rw3dh6t+a43YB3xO4
	 jrgui7rRLp2kIZgvGccLAzchZ0A+2mq3JiiCygaA=
Date: Mon, 10 Feb 2025 07:13:01 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Matt Lee <matt@oscium.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/2] USB: max3421: Fix retransmit handling and scheduling
 while atomic
Message-ID: <2025021040-delirium-yeah-d4a0@gregkh>
References: <CABrMTjdyZX3P4-0hjndjAFer7FaA+rRNmLLjigg8qjV6VbLP1g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABrMTjdyZX3P4-0hjndjAFer7FaA+rRNmLLjigg8qjV6VbLP1g@mail.gmail.com>

On Sun, Feb 09, 2025 at 11:06:42PM -0600, Matt Lee wrote:
> This patch series addresses two issues in the max3421 USB host controller
> driver:
> 
> 1. **Patch 1** This patch reverts the removal of the slow retransmit of NAK
> responses.  This fixes some USB accessories from becoming unresponsive.
> 
> 2. **Patch 2** fixes a "scheduling while atomic" bug in `max3421_remove()`
> by ensuring that `kthread_stop()` is called outside a spinlock, preventing
> a system crash when removing the driver or shutting down.
> 
> Both patches have been tested on a BCM2711 with MAX3421 hardware.
> 
> Kind regards,
> Matt Lee
> matt@oscium.com
> 
> ---
> 
> **Patches:**
> **[PATCH 1/2] USB: max3421: Fix retransmit handling for NAK responses**
> **[PATCH 2/2] USB: max3421: Fix scheduling while atomic in
> max3421_remove()**


Sorry, you can't attach patches, please send these as a proper patch
series.

thanks,

greg k-h

