Return-Path: <linux-usb+bounces-22160-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A686CA71176
	for <lists+linux-usb@lfdr.de>; Wed, 26 Mar 2025 08:35:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BC8E173F6A
	for <lists+linux-usb@lfdr.de>; Wed, 26 Mar 2025 07:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4375119D884;
	Wed, 26 Mar 2025 07:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FVUGVFSb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C246C145B3F
	for <linux-usb@vger.kernel.org>; Wed, 26 Mar 2025 07:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742974498; cv=none; b=f6UTLhErK9H3xRDePVAYHy1KQLjhK9Q+dizNLsXHkqzyTZ73yangDGlS5/CAZQERZYW48AxLHzblGTVp2Gk1BzKQyexZoL6UnH69YiR1G/6D6PFeD+4XYDYJkGzX+UcZvPcpQmciUWIP8nLT+HtvZFlgLqoYtsIzvo6LsXf6SEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742974498; c=relaxed/simple;
	bh=9y5r4j//LpMZTtAeAuDlFJ8412+n/rp9qFrn2K03BzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PVDLd8wchqwwHjoa3XmzHec1mBy9+ILXCZ3bmVDqE/UjCa5QlJqzMP2aRXgu1PCj/kilHCrud4p6vrvZYAeFSGYsp26t3JfWMxLkO60HLG/yqBwFEkkMAQFkyc9pwZJMASTn0mLXDGKkz2Xwf49NeyheeXHc483GZuSLYXk8PZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FVUGVFSb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E185C4CEE2;
	Wed, 26 Mar 2025 07:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742974498;
	bh=9y5r4j//LpMZTtAeAuDlFJ8412+n/rp9qFrn2K03BzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FVUGVFSbkPe//Q8FeWwvPJ40BjdVBNuU0lBaVM/cxepWnKfVss+2bKERngBFp3TuO
	 k+D8HWDLoKWufVB6fQsDfO3UME9dXpi1f07Gmx8+jyiA3Bg9RTn7tNcYCMQ/f5vQZ/
	 SstlRKKGajUhwBQSan27B3QM5+ExgsGe1tJaK2XzaWHM+TrMy0XzIWVfYY6ojawmAM
	 laXNpreeG9jkXX0c1VQA7bAnbmTd/G/qPtT3G1BqGbphV0nkiTnsXmgGKRIhxK0Lrg
	 W8PVX+kzsn7CnN16SaSsoEb8L2a0VELt3riOIPOWFFibEG9Dnkbw0Hc/moZe0STnqV
	 Hdfp1Zx7K/L3w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1txLHv-0000000068l-0qWf;
	Wed, 26 Mar 2025 08:34:59 +0100
Date: Wed, 26 Mar 2025 08:34:59 +0100
From: Johan Hovold <johan@kernel.org>
To: Lars Melin <larsm17@gmail.com>
Cc: Adam Xue <zxue@semtech.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	Iulian Mocanu <imocanu@semtech.com>
Subject: Re: USB: serial: qcserial: patch for adding Sierra Wireless 9x50,
 EM91, EM92 and SDX35.
Message-ID: <Z-OuI3srltVv8HX_@hovoldconsulting.com>
References: <DS7PR20MB4855FE3E27EFAD39D56FF897C6D82@DS7PR20MB4855.namprd20.prod.outlook.com>
 <e36409d1-60b3-4ee5-a4b3-1f5976c8ef0b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e36409d1-60b3-4ee5-a4b3-1f5976c8ef0b@gmail.com>

On Wed, Mar 26, 2025 at 08:36:23AM +0700, Lars Melin wrote:
> On 2025-03-21 05:08, Adam Xue wrote:

> > This is the patch for adding support for Sierra Wireless and Semtech products based on
> > Qualcomm 9x50, SDX35, SDX55 and SDX65 based products (EM75xx, EM91xx, EM92xx).
> > Currently, only our products based on Qualcomm 9x30 and older chipsets are supported.
> > These products have a different USB interface layout compared to the default one which
> > require code changes. The VID/PID list has also been updated for all products mentioned above.
> > Please review.

> this is a NAK of the patch from me. EM9191 (1199:90d3) is already 
> supported in the option serial driver and that is also where the other 
> Qualcomm SDX based Sierra devices should be included in my opinion.
> SDX devices from other mfgr are also supported in option so it makes no 
> sense to add more special code for Sierra in qcserial each time Sierra 
> decides to change their compositions for new devices.
> This is all up to Johan of course who may have a different opinion than me.

I fully agree. Thanks for reviewing, Lars.

Johan

