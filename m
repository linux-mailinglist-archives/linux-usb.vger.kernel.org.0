Return-Path: <linux-usb+bounces-15111-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C407F978C8A
	for <lists+linux-usb@lfdr.de>; Sat, 14 Sep 2024 04:04:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4B851F237EF
	for <lists+linux-usb@lfdr.de>; Sat, 14 Sep 2024 02:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AAA6C133;
	Sat, 14 Sep 2024 02:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eLI01uXq"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C8879DC;
	Sat, 14 Sep 2024 02:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726279462; cv=none; b=p2TrHSDEEjFvrh0bsMwVlhP+J7uBXicQkjgg4lb6QcxxuCvdqnYgEcs/sWOytZrFdJa7CCsG13INy1CjDQHLsmKjTiZlU2cqJSBLqLVXOuXxPl+nwq06htwP0Fl+Xc6VD3UsghCpOuiyugZ1U0TW8p/ay0+661fe0TBePb0VqOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726279462; c=relaxed/simple;
	bh=lGe1gUr2lyFNLcM2vBDH6nkw9jLR96wITy4Kj2optVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZgqQUgLWoPxxOwBCCdxwgL7uQDbfLGrIKUZIRy1ZtcqXzsZ0HCjThKjVzxk5CnbTfsKHRvo3EdsSpa5sT9ibVKSXui3dZgT/BkH5m950oKpOtr5CIXZbwwdIOuSaMoKr6b13J5eiRJ47NhytHvUvYxnnHxb0vTr44rQD2DNmk5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eLI01uXq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CE30C4CEC0;
	Sat, 14 Sep 2024 02:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726279462;
	bh=lGe1gUr2lyFNLcM2vBDH6nkw9jLR96wITy4Kj2optVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eLI01uXq/5SKuXD5VChrt3Nb75i84VF1gBxYtPcM8t8ox2wB+k7h5TYHajP/uIdVq
	 szpwN4oWL4b/c0y89cXiUW6zzyKzwjSeypCaj7KoeTqa1cZ8jNvb3LHG21h2zOwLZ2
	 XB6EPAXPiWtQAzQpsMTRRQz4ucFfPQZezvioY+Xi5p91mGcjKnAmKvoYuqZ6JCA1tB
	 59KJbmPm+Q0+vuVToCBgELJev3JlL76SxWeFuUS5QM48Y40CE+IOxibNFv/gXmnFFV
	 BbZbhe0UpTdRpxzoQNBFQkkDdoTXO0wBTUe+VFAhZgpZO6sI0nscdccoZpD1SoDpo0
	 pzFMk8pDDhnDA==
Date: Sat, 14 Sep 2024 10:04:14 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 1/2] usb: chipidea: udc: limit usb request length to max
 16KB
Message-ID: <20240914020414.GA2887@nchen-desktop>
References: <20240912045150.915573-1-xu.yang_2@nxp.com>
 <20240913012045.GA320526@nchen-desktop>
 <20240913071133.pstilja3z25yey2p@hippo>
 <20240913095344.GA321485@nchen-desktop>
 <20240913152513.uxgwkedh5ryq5ktl@hippo>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913152513.uxgwkedh5ryq5ktl@hippo>

On 24-09-13 23:25:13, Xu Yang wrote:
> On Fri, Sep 13, 2024 at 05:53:44PM +0800, Peter Chen wrote:
> > On 24-09-13 15:11:33, Xu Yang wrote:
> > > On Fri, Sep 13, 2024 at 09:20:45AM +0800, Peter Chen wrote:
> > > > On 24-09-12 12:51:49, Xu Yang wrote:
> > > > > Currently, the deivice controller has below limitations:
> > > > > 1. can't generate short packet interrupt if IOC not set in dTD. So if one
> > > > >    request span more than one dTDs and only the last dTD set IOC, the usb
> > > > >    request will pending there if no more data comes.
> > > > > 2. the controller can't accurately deliver data to differtent usb requests
> > > > >    in some cases due to short packet. For example: one usb request span 3
> > > > >    dTDs, then if the controller received a short packet the next packet
> > > > >    will go to 2nd dTD of current request rather than the first dTD of next
> > > > >    request.
> > > > > 
> > > > 
> > > > Are there any IP errata for it?
> > > 
> > > No. It's decided by hw IP design. This old design may not suit current
> > > requirements.
> > > 
> > > > 
> > > > > To let the device controller work properly, one usb request should only
> > > > > correspond to one dTD. Then every dTD will set IOC. In theory, each dTD
> > > > > support up to 20KB data transfer if the offset is 0. Due to we cannot
> > > > > predetermine the offset, this will limit the usb request length to max
> > > > > 16KB. This should be fine since most of the user transfer data based on
> > > > > this size policy.
> > > > > 
> > > > > Although these limitations found on OUT eps, we can put the request to IN
> > > > > eps too, this will benefit the following patches.
> > > > 
> > > > Since IN endpoints have not found the problem, please limit the changes
> > > > only for OUT endpoints.
> > > 
> > > This 1st patch is mainly used to serve the 2nd patch which may impact
> > > both IN and OUT eps.
> > ...
> > > Because it's hard to judge whether a request is
> > > suit for transfer if it spans more dTDs. So it's needed for both eps.
> > 
> > Sorry, I do not understand you above words. First, you may know this
> > request is for IN or OUT, second, according to TD size and data buffer
> > address, you may know you use one or more dTDs.
> 
> If req.num_sgs = 0, then we can know how many TDs need to transfer data.
> 
> For example:
> req.buf = 0xA0001800 req.length = 40KB
> 
>  - TD1 addr:0xA0001800 size:18KB
>  - TD2 addr:0xA0017000 size:20KB
>  - TD3 addr:0xA002D000 size:2KB
> 
> We basically won't meet issue for non-sg case. The only expection is that
> received short packet on TD1 (or TD2). Then the next data packet will go
> to TD2. But it should go to TD1 of next request.
> 
> But if num_sgs > 0, we need to check validity of each sg entry due to above
> limitations.
> 
> For example:
> req.num_sgs = 3 req.length = 40KB
> 
>  - sg1.addr = 0xA0001800 length = 18KB -> TD1
>  - sg2.addr = 0xA0016000 length = 20KB -> TD2
>  - sg3.addr = 0xA0028800 length = 2KB  -> TD3
> 
> This request can be safty used to transfer data. But we can also meet
> previous short packet issue.
> 
> req.num_sgs = 5 req.length = 10B + 20KB
> 
>  - sg1.addr = 0xA0001800 length = 10B -> TD1
>  - sg2.addr = 0xA0016000 length = 6KB -> TD2
>  - sg3.addr = 0xA0028800 length = 6KB -> TD3
>  - sg4.addr = 0xA003A000 length = 4KB -> TD3
>  - sg5.addr = 0xA004C000 length = 4KB -> TD3
> 

With your the 2nd patch, you could make end of sg1.addr is PAGE aligned,
in that case, the sg1 and sg2 could be at the one TD. sg1 is at the
first dTD, and sg2 at the 2nd & 3rd dTD. If that could be done, the
host may not see short packet, anyway, you could confirm through
analyser.

Peter

> This request can't be used to transfer data since sg1 + sg2 can't
> form a data packet. The host will see a short packet (100 bytes).
> 
> req.num_sgs = 5 req.length = 20KB + 10B
> 
>  - sg1.addr = 0xA0001800 length = 2KB -> TD1
>  - sg2.addr = 0xA0016400 length = 5KB -> TD2
>  - sg3.addr = 0xA0028800 length = 8KB -> TD3
>  - sg4.addr = 0xA003A800 length = 5KB -> TD4
>  - sg5.addr = 0xA004C200 length = 10B -> TD5
> 
> Compared to previous request, it need 5 TDs even though req.length
> are same. Most of the sg entries can't share same TD since their
> address is not page aligned. For high-speed isoc eps, sg1 + sg2 can't
> form a 3KB DATA2 + DATA1 + DATA0 data sequence too. 
> 
> Therefore, it's a bit complicated to validate request if num_sgs > 0,
> especially when req.length is larger than 16KB (1 TD size).
> 
> When add such condition, each of the sg entry must follow below
> requirements:
>  1. the end address of the first sg buffer must be 4KB aligned.
>  2. the start and end address of the middle sg buffer must be 4KB aligned.
>  3. the start address of the last sg buffer must be 4KB aligned.
> 
> So it will be more easy to validate the request.
> 
> Hope this will help you understand the motivation of 1st patch.
> 
> Thanks,
> Xu Yang

