Return-Path: <linux-usb+bounces-7915-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 498A787A414
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 09:24:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E23C91F21F8C
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 08:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F3E619473;
	Wed, 13 Mar 2024 08:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jom4/seo"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EB0175BF
	for <linux-usb@vger.kernel.org>; Wed, 13 Mar 2024 08:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710318268; cv=none; b=XwHm7GM8CpTFmW/GKWWx6xXg3JokUqe3eSexsD4gUrJhSvGb3hSrwgzXwzgvSpl9wdTz5ITAAzHycMh39M15xLfKx2i0rZX7ozcwpM0Q3AA6nuNQ7QJrenImeIGDjJI3QNycLrQ59ZuoB9ls2Kt8icpHUK24f6oTM16ntxmsYZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710318268; c=relaxed/simple;
	bh=lPjCAkcaqslmneOMqMEpnbGxqyhS+Cvz6ByrNnymWxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M4jkeubXsE1LKqLGC0nHzi3A3Q6hy1vi/+m5D1Tpy5aNNIetJhQ5a65Kzy45g7WpOMOslJCGcZ1CM9guTJ//m9fyOSUdkYTkaet3LamfIuiCvjSp9vUwdH8lfUkyYXnjyIWZRsrua+9PImSubo/Cty20BNUo9siwa1SeKNanL/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jom4/seo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D34A0C433F1;
	Wed, 13 Mar 2024 08:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710318267;
	bh=lPjCAkcaqslmneOMqMEpnbGxqyhS+Cvz6ByrNnymWxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jom4/seoFfmkZ2AW1VQNtSr6wExZtD4Xp8dgi9PB0KfbxXgkPhklrE7AA6TIO/bb0
	 i+XIN+/I0LTJuU56hFIPaDilPM7ymiSxSYYkyNeOMzr9AJtZUMsSOyfoe2oix82dC/
	 /0rV0Sfhe01TSHgHj2ZJaA0VQP47K3nleoHP62QWBFZBN/AKViES7LbVf7bwF6kwhS
	 pxkgqW2TO6k837eTJNRtdm2mY5PzqYRpfyozn2hCMqJcukt+W+WfJ7wfLEZi3gq7La
	 fGR/oSQIkvuZd1TmVdO0vvW2vRcKrQtEolIyS/DQb+1OmjwGXsshW6dCFv/1A2XRd0
	 bKB1zhnHxHMOQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rkJuc-000000007Wj-2CDL;
	Wed, 13 Mar 2024 09:24:35 +0100
Date: Wed, 13 Mar 2024 09:24:34 +0100
From: Johan Hovold <johan@kernel.org>
To: Alex Henrie <alexhenrie24@gmail.com>
Cc: linux-parport@lists.infradead.org, linux-usb@vger.kernel.org,
	sudipm.mukherjee@gmail.com, daniel@gimpelevich.san-francisco.ca.us,
	hkzlabnet@gmail.com, reboots@g-cipher.net, mike@trausch.us
Subject: Re: [PATCH 4/7] usb: misc: uss720: point pp->dev to usbdev->dev
Message-ID: <ZfFiwlWTbF5_zoUA@hovoldconsulting.com>
References: <20240312055350.205878-1-alexhenrie24@gmail.com>
 <20240312055350.205878-4-alexhenrie24@gmail.com>
 <ZfAG0uEmtiOBNeR_@hovoldconsulting.com>
 <CAMMLpeRpMwL3+c-uBrASuDOT4=YmxGRn5q1g8xKw2BAfdpujNQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMMLpeRpMwL3+c-uBrASuDOT4=YmxGRn5q1g8xKw2BAfdpujNQ@mail.gmail.com>

On Tue, Mar 12, 2024 at 07:30:21PM -0600, Alex Henrie wrote:
> On Tue, Mar 12, 2024 at 1:39 AM Johan Hovold <johan@kernel.org> wrote:
> >
> > On Mon, Mar 11, 2024 at 11:50:29PM -0600, Alex Henrie wrote:
> > > This avoids a "fix this legacy no-device port driver" warning.
> >
> > Please be more specific.
> 
> Hello Johan, thanks for taking a look at these patches.
> 
> The warning comes from parport_announce_port in
> drivers/parport/share.c. include/linux/parport.h says that dev is the
> "Physical device associated with IO/DMA." Commit 4edb38695d9a
> ("parisc: parport0: fix this legacy no-device port driver!",
> 2013-05-30) fixed a similar issue and says only "Fix the above kernel
> error from parport_announce_port() on 32bit GSC machines (e.g. B160L).
> The parport driver requires now a pointer to the device struct."
> 
> Do I just need to include "The parport driver now requires a pointer
> to the device struct" in the commit message? If not, where can I learn
> more about what the dev field is for, to be able to write a better
> description of why it's necessary to fill it in?

Your commit messages need to be self-contained and explain *why* you
think your proposed change is needed, and in enough detail that a
reviewer can make a judgement as to whether the patch is correct or not.

Basically all my comments were just pointing this out.

Johan

