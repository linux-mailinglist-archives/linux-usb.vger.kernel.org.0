Return-Path: <linux-usb+bounces-9700-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CB28B0259
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 08:43:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A9C51C21ED4
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 06:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D327E156C53;
	Wed, 24 Apr 2024 06:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QPCNQIaX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DB715747D;
	Wed, 24 Apr 2024 06:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713940919; cv=none; b=brSOkcKGuLmVxSA5EIz6Y7aHuVPHzuypb1amYGu/2FcuvxtC8cC7wp2qWXA8xJvjVX10btqvEMdyos2NgiueQIV19Xh7u7nkcgA5pTY+Z6NgXjKtzTR2CkKBq47jKejT6GdXEpE0NnheD6/gY7klQO6+XsSVJGFBtYP96GJIWOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713940919; c=relaxed/simple;
	bh=SGrrp8eRm1Ip1OEAU0Cjtn5d1Rb8lMCFrvzKHN0ptvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qrkLxeMYNCraArqy4N2o/bzxjDyv3Q8bl+ID1QIoDibbMeUTtK1sl3CcFzJUgAYw/iDjB21QIjlLK65Uxhe3hLu9VjypsbUN17ImbaSeXKfnUc4Mrm47ShYXhPzF3ZZaedSAlQqQOe6VH8ojq5uuwZ28BKX6gd5u8afQn4l4VaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QPCNQIaX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF3EEC113CE;
	Wed, 24 Apr 2024 06:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713940918;
	bh=SGrrp8eRm1Ip1OEAU0Cjtn5d1Rb8lMCFrvzKHN0ptvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QPCNQIaX6TMQy+BBIJuymgvH3N5Q0il43+yTa2oE8cszkm1gh/1oDKkXQH+VvY405
	 JaLp5+PeyRg8TNP0cLn0EieW9K5OsV85Hy8W716KgzfGWfhjLztfJJmzloiRpSMptb
	 gDfzntRk5gqWEG3CrYESjNtGB//pYx/TUruEFuyiYWbYeVwndIBewJO9ZzmQ3eI3xH
	 JG943ZUiCxAJQVxLJlM4gvQ18hLfw/gC7ajKs1vUPGrCXNVrazJLLerQY6Gv5Xnmne
	 Rjg6yA/AEpUb8tc6c2pw/jImqB604scOR2wG0fBFSQWT4ognDIrnntMHF1vCzC1aGZ
	 k8mxIW8J0z/Xw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1rzWKK-000000008Ft-1fwY;
	Wed, 24 Apr 2024 08:41:57 +0200
Date: Wed, 24 Apr 2024 08:41:56 +0200
From: Johan Hovold <johan@kernel.org>
To: kernel test robot <lkp@intel.com>,
	Krishna Kurapati <quic_kriskura@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: Re: [usb:usb-testing 7/12] drivers/usb/dwc3/core.c:1482:69: warning:
 '%d' directive output may be truncated writing between 1 and 11 bytes into a
 region of size 4
Message-ID: <ZiiptMEL2_AdBsJA@hovoldconsulting.com>
References: <202404241215.Mib19Cu7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202404241215.Mib19Cu7-lkp@intel.com>

On Wed, Apr 24, 2024 at 01:03:07PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> head:   a160e1202ca318a85c70cf5831f172cc79a24c57
> commit: 846b4bacf2d48212f271fc1ef7488bcdf2c75bcb [7/12] usb: dwc3: core: Refactor PHY logic to support Multiport Controller
> config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240424/202404241215.Mib19Cu7-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240424/202404241215.Mib19Cu7-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404241215.Mib19Cu7-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/usb/dwc3/core.c: In function 'dwc3_core_get_phy':
> >> drivers/usb/dwc3/core.c:1482:69: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 4 [-Wformat-truncation=]
>     1482 |                         snprintf(phy_name, sizeof(phy_name),  "usb2-%d", i);
>          |                                                                     ^~
>    drivers/usb/dwc3/core.c:1482:63: note: directive argument in the range [-2147483641, 254]
>     1482 |                         snprintf(phy_name, sizeof(phy_name),  "usb2-%d", i);

This version or s390-build of gcc appears to be confused as the
variable i is clearly in the range [0,254] in these for loops.

I also don't see this W=1 warning with my gcc-10 (aarch64).

It may be possible to work around this by using u8 type for the iterator
(and %u in the format), but I'm not sure we should be working around
compiler bugs like that.

>          |                                                               ^~~~~~~~~
>    drivers/usb/dwc3/core.c:1482:25: note: 'snprintf' output between 7 and 17 bytes into a destination of size 9
>     1482 |                         snprintf(phy_name, sizeof(phy_name),  "usb2-%d", i);
>          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

>   1446	static int dwc3_core_get_phy(struct dwc3 *dwc)
>   1447	{

>   1450		char phy_name[9];
>   1451		int ret;
>   1452		int i;

>   1478		for (i = 0; i < dwc->num_usb2_ports; i++) {
>   1479			if (dwc->num_usb2_ports == 1)
>   1480				snprintf(phy_name, sizeof(phy_name), "usb2-phy");
>   1481			else
> > 1482				snprintf(phy_name, sizeof(phy_name),  "usb2-%d", i);

>   1493		}

Johan

