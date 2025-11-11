Return-Path: <linux-usb+bounces-30305-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E5066C49E89
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 01:48:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F28294F1C7F
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 00:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED6A5256C8D;
	Tue, 11 Nov 2025 00:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RchHejv5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BDB1DF258
	for <linux-usb@vger.kernel.org>; Tue, 11 Nov 2025 00:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821973; cv=none; b=Kpe+P4+FH/tdpDzstCgfkFwCakhULlVAYAKn1a4mdXd66vSsAeHJDhsveCW8F1Ib/ztDm3XgHUtYfNyEfVew1Kbud8OXfFdMER9Jnvoe0Ok8o6lb/NSJrqR9ACGpBLFSHj1vFhYJ9oKFPtA5VV58zj46pmvdZqKU9kdssmW5w7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821973; c=relaxed/simple;
	bh=TLR0pnqEUodp3WlabTr5M/jdcc+KZl4n0IT+C6BsSWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GbNF3blAW83lNyIBXuWsVhRDJjJiGdFUj8OuRPx95BVXTJlUGJCfS+Nq/nYLJfL+eFcWd5Z1Mv52CG2BulcnMRJ+y/k15Ai1yTNdvh2KVdRbeVVGjaNERhW5K1uq574GUMAWBac27JdmFeuF1dGfMnCpo0qmGv9V1ulqHzi7X/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RchHejv5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACC40C19425;
	Tue, 11 Nov 2025 00:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1762821973;
	bh=TLR0pnqEUodp3WlabTr5M/jdcc+KZl4n0IT+C6BsSWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RchHejv5hlcS4x1nlWbdYAGx1XNeb3yU8a3CkZjdGJEzA44o2GH711lZPry2vjsvS
	 AyuMoJ1hLrdko+Ao3kkmHzEuDf6ueEF29sDJcHwIe7MsRAJPjPmCNNn9QBDNor2BIq
	 oNCqBXMcDlcDyvwtEVFzXiOX8qgNJ7zBO4w9r50o=
Date: Tue, 11 Nov 2025 09:46:10 +0900
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: "Pathak, Asutosh" <asutosh.pathak@intel.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"dmitry.baryshkov@oss.qualcomm.com" <dmitry.baryshkov@oss.qualcomm.com>,
	"heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
	"Katiyar, Pooja" <pooja.katiyar@intel.com>
Subject: Re: [PATCH v5 0/4] usb: typec: ucsi: Add support for SET_PDOS command
Message-ID: <2025111147-setback-unmolded-4538@gregkh>
References: <cover.1761773881.git.pooja.katiyar@intel.com>
 <MN0PR11MB5985412F8014513916F7F4FD81CEA@MN0PR11MB5985.namprd11.prod.outlook.com>
 <MN0PR11MB5985A404B77A3A2CB3E96D2E81CFA@MN0PR11MB5985.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MN0PR11MB5985A404B77A3A2CB3E96D2E81CFA@MN0PR11MB5985.namprd11.prod.outlook.com>

On Tue, Nov 11, 2025 at 12:21:58AM +0000, Pathak, Asutosh wrote:
> Hi Greg,

Please do not top-post :(

> Could you please take these series of patches into your next upcoming release?
> These patches are rebased on v6.18-rc3
> 
> https://patchwork.kernel.org/project/linux-usb/list/?series=1017784

Please relax, it's been less than 2 weeks, and I've been traveling
non-stop (still have 2 more continents to go).  Patches will be handled
when I get to them.  To help out, please review other patches on the
list to cause yours to bubble to the top.

thanks,

greg k-h

