Return-Path: <linux-usb+bounces-19631-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3CCA1930B
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 14:53:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC5693AD91D
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 13:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C953213E7A;
	Wed, 22 Jan 2025 13:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="C9fAfW9X"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48FC1E4AB
	for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2025 13:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737553962; cv=none; b=QawO61iH9MSiSg2n8vvLkI1lCs5mKyaDvYfUtHQeAWWZW0VQpp2EvbnlQWTaRqqmqjaxBKkzZll7+2WA5rH8+PBxrz/3FduNbKE/eBKmC2DpoXQR3JIeFISeeHU4mbINxb2to4fim1ezHLFpXhYwobVgQorYQDuaqiqgJXrRCgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737553962; c=relaxed/simple;
	bh=tllXbrGO1ojvJriVGT85IncnB+JBqRgiWldZgKmWIgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=utJQpUwwHhprdSopMXJXABfQnsNBzdPwfSFWk6qcMnIfaua7Q4icEp0/HEyVdd+ckGh4gGuNxs0et+QzypwegjKvUrC58plG1ZURy7+HCan9FpWeBdMiWYVDHz4YkRJdMb8NaI/cA9Rp/GQVPddICSjeErhTNzy2a/cDj1tAAgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=C9fAfW9X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA838C4CED2;
	Wed, 22 Jan 2025 13:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737553961;
	bh=tllXbrGO1ojvJriVGT85IncnB+JBqRgiWldZgKmWIgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C9fAfW9XQWSUTf5tc8at0HGvlFZ2uZTvjPqG7FKjFMajZq42eUDvSmouxy1kB/Oou
	 NlGxLcuR1XDzwGI8svJEW9vO1R1QCHVCCfLSQstmjA93c78iyHv2lDy0twYjjO7c3p
	 tvJYk60soFTCz8acWAcs55RSPbsIHHTODav9evOU=
Date: Wed, 22 Jan 2025 14:52:38 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Oliver Neukum <oneukum@suse.com>
Cc: Camila Alvarez <cam.alvarez.i@gmail.com>,
	USB list <linux-usb@vger.kernel.org>
Subject: Re: Your fix for most_usb.c::hdm_disconnect
Message-ID: <2025012247-scrunch-nuptials-cf11@gregkh>
References: <e8310fd2-caa7-4a78-8ff1-2bc2d07d74c1@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8310fd2-caa7-4a78-8ff1-2bc2d07d74c1@suse.com>

On Wed, Jan 22, 2025 at 02:44:59PM +0100, Oliver Neukum wrote:
> Hi,
> 
> I am going through syzbot's list of open issues.
> It look like like the issue you posted a patch for
> 
> https://lore.kernel.org/all/20240730035745.110637-1-cam.alvarez.i@gmail.com/T/
> 
> is still open. Can something be done? Has the patch been lost?
> Is there a remaining issue?

The subject line was totally wrong which is why it was probably ignored.

Also, are you sure it is right?  Grabbing a reference in a disconnect
function feels very wrong...

thanks,

greg k-h

