Return-Path: <linux-usb+bounces-18766-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBC99FBA00
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2024 07:57:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 775F718832F5
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2024 06:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0094B183CD1;
	Tue, 24 Dec 2024 06:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xbdqtSQe"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC1727702;
	Tue, 24 Dec 2024 06:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735023444; cv=none; b=jUrl+FnOzUkg8+XMH6GEdJ0JzHZSjO81kf2Eqs/nXqsQRNbDGwiVDasoPbfB5H+kQfLqDmZJXSXMqDHVp/sKQcUpq2Yv3Jv3hn4fVngZwbtmJ7w6jqCqiysEzmtQjeJjkKtm30S8kbUJDyY5XueBxs9Pr4NdN+zKQu4EEWlfcLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735023444; c=relaxed/simple;
	bh=SNH4I1aYLVRvyxMIWpO8H+OiNsIEteJedPisSBmZ4qI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uFmNbXicnqOn5BHGSDIwv3bq/ViAJ5lD1eI2kjbOIveykVCXEwfdyVqD9RiRVgLGUjbQ268ebXLb5/gIMgAOagIzJMt+d8obl6IqjI4Kv6aMAK/tGxlt2734GxMmKaorNy7nCph3GyxaKd2Ing0tUmkXfTgcJSI0Jd9lKpWIBvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xbdqtSQe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4348BC4CED0;
	Tue, 24 Dec 2024 06:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1735023443;
	bh=SNH4I1aYLVRvyxMIWpO8H+OiNsIEteJedPisSBmZ4qI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xbdqtSQePNPK01pFOeTP5xjDpIhH64jEV4vHedCaccttIzMtddIbZPu06ozSNnBIv
	 mbbZhUcuPntaFYqSYKEKqvWqQz8mIGmsK9cHis9eCU6XFXQ1DstaSdhi+eGTlT8bgv
	 aC681Z/sM5iMN/qx1l/r+PPP9s7/t+TlMGOclzpc=
Date: Tue, 24 Dec 2024 07:56:38 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Benson Leung <bleung@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v11 2/2] usb: typec: ucsi: Implement ChromeOS UCSI driver
Message-ID: <2024122433-aids-varnish-8a5b@gregkh>
References: <20241210144527.1657888-1-ukaszb@chromium.org>
 <20241210144527.1657888-3-ukaszb@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241210144527.1657888-3-ukaszb@chromium.org>

On Tue, Dec 10, 2024 at 02:45:27PM +0000, Łukasz Bartosik wrote:
> From: Pavan Holla <pholla@chromium.org>
> 
> Implementation of a UCSI transport driver for ChromeOS.
> This driver will be loaded if the ChromeOS EC implements a PPM.
> 
> Signed-off-by: Pavan Holla <pholla@chromium.org>
> Co-developed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Co-developed-by: Łukasz Bartosik <ukaszb@chromium.org>
> Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
> ---
>  MAINTAINERS                           |   7 +
>  drivers/usb/typec/ucsi/Kconfig        |  13 +
>  drivers/usb/typec/ucsi/Makefile       |   1 +
>  drivers/usb/typec/ucsi/cros_ec_ucsi.c | 337 ++++++++++++++++++++++++++

Given all of the 0-day reports I now have in my inbox for this driver,
I'm going to drop this series from my tree.  Chromium developers, please
do better testing, these are simple build issues that you all should
have caught way before version 11 of the driver :(

thanks,

greg k-h

