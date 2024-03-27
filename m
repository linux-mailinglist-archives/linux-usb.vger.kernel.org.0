Return-Path: <linux-usb+bounces-8456-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 886E788D6E3
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 07:59:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9A641C24910
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 06:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB83F23773;
	Wed, 27 Mar 2024 06:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wLu5Wy0a"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6621CF90;
	Wed, 27 Mar 2024 06:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711522763; cv=none; b=SKqcLCd2KHWJMlDWPSx0DKwXIrCePu/SvxUlJ4MjR787zaR0ofrB4w34Q5N60H8hSUsnAL6QUbAFGoOjLov/2xajb14ULYis85oCX/sUU1Zs3UcPhC24L2QhQDcvfeEk0K1vX+AAHskZXNTkw1Fv32kzft/+ICCCrV3RTWAFDnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711522763; c=relaxed/simple;
	bh=hLDOEBys0tDZ3VSLJwmVJX4b55pSZYLrwlnBPzgYRh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KDxCwhT2lUymUZ1cB2KVbblJYPD2Cont2yCuwsRihQAkYulQXPG7WL/iVOKUTh/fB8uhtocmwIQDd/f7SkIRR+6zPM/EY9dN1zgJuJh1ykQhE4lG7zN6xW8hWdacOT0IyRjwWao7Euw9UNTQVUAQHXcjibszmbwWxY2jNEd8FtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wLu5Wy0a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FFE6C43390;
	Wed, 27 Mar 2024 06:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711522762;
	bh=hLDOEBys0tDZ3VSLJwmVJX4b55pSZYLrwlnBPzgYRh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wLu5Wy0azCwqVv3r0vGrPBrQMJ9bEGQgT3j2gA3ArDFWVJW9sO+a+AbZU6O5eZh5f
	 XDfmST3B6wGU2fFLJLuUsYV07pMGOgqPgrtGA3GoSNzpaTr20XB6EYn0E5POFMlv+E
	 LZEFOMfb0tcrRLidGzrxFbTxXFErOgQxNSaHhWbU=
Date: Wed, 27 Mar 2024 07:59:19 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Luca Weiss <luca.weiss@fairphone.com>, Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [usb:usb-testing 9/45] kismet: WARNING: unmet direct
 dependencies detected for DRM_AUX_BRIDGE when selected by TYPEC_MUX_PTN36502
Message-ID: <2024032754-overjoyed-curable-fb13@gregkh>
References: <202403270819.6h8lCV3J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202403270819.6h8lCV3J-lkp@intel.com>

On Wed, Mar 27, 2024 at 08:18:11AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> head:   5e589e59202db9b19b5a4a01c8de78435f86fde1
> commit: 9dc28ea21eb40b9d023297ad9d513252260b1d63 [9/45] usb: typec: ptn36502: switch to DRM_AUX_BRIDGE
> config: alpha-kismet-CONFIG_DRM_AUX_BRIDGE-CONFIG_TYPEC_MUX_PTN36502-0-0 (https://download.01.org/0day-ci/archive/20240327/202403270819.6h8lCV3J-lkp@intel.com/config)
> reproduce: (https://download.01.org/0day-ci/archive/20240327/202403270819.6h8lCV3J-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403270819.6h8lCV3J-lkp@intel.com/
> 
> kismet warnings: (new ones prefixed by >>)
> >> kismet: WARNING: unmet direct dependencies detected for DRM_AUX_BRIDGE when selected by TYPEC_MUX_PTN36502
>    
>    WARNING: unmet direct dependencies detected for DRM_AUX_BRIDGE
>      Depends on [n]: HAS_IOMEM [=y] && DRM_BRIDGE [=y] && OF [=n]
>      Selected by [y]:
>      - TYPEC_MUX_PTN36502 [=y] && USB_SUPPORT [=y] && TYPEC [=y] && I2C [=y] && (DRM [=y] || DRM [=y]=n) && DRM_BRIDGE [=y]

Odd that no other arch triggers this :(

Luca, can you make up a fixup patch for this that I can apply to my
tree?

thanks

greg k-h

