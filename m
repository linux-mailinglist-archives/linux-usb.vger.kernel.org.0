Return-Path: <linux-usb+bounces-11771-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2541D91BB1D
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2024 11:10:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 574B61C23170
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2024 09:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99DE1552EB;
	Fri, 28 Jun 2024 09:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VqByt036"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28B61514C0
	for <linux-usb@vger.kernel.org>; Fri, 28 Jun 2024 09:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719565661; cv=none; b=QrDphD67O58iCdErSqLAKzGyvmYAowPnYxS8pc1lCntCtnP8I45mYmV35VcCs2uF1R07UQiiReykZMrLCG6SWL06Hv8fi4QGQncT+nycjE5agxnMUyVnsFvOIUgm6P2jzIurMt3pCNXS9wjgoS1nofFm8HCDb+eqJ7Al7HC2SQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719565661; c=relaxed/simple;
	bh=Op3IKsnrDWB4tHueGffcV3PAE+ZPeXkA/iGQIKJVafM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TZk3a3OOsYb3SQScCwm8v8oahQ5iPVA9c6Wq7Pa+7QC41YJ9RoRyNxvSq9ucsJJbvV0NlS6ZmQtLK1G5+wMZaYgXWxCsbiIhxBc9LeWw2CrZHcZjyXtv/ecWNjfLYP6BfauSmx3OlW8B9hZi4LgB38gaxB5lXhVbdz+SDmbUsfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VqByt036; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719565660; x=1751101660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Op3IKsnrDWB4tHueGffcV3PAE+ZPeXkA/iGQIKJVafM=;
  b=VqByt036BSNGErschbejsvboTOLAAPIUzFQk1kHW3sNCKdmE0GXxwkJ6
   6ienDE1MvzhYmoMOJe2WZi4qRXRqiGFjINDx2ruPO4O91yhmoJCYiV19P
   A2uuSWy3nmndRpHD8iN7/8ZClwnNVFE/fos7qTLuK/V0IJ3gHkSLWOXhw
   r42M0uW81KNaiZrDOvyxCOAHHg9PvF8cfba7+jEghXVFZWDn/I1LpfY8S
   kcDf5xjlYE7Wjmv8cvVDpNE6OBeGHrBB7mJWlfBljx5tA7H0HnMUxqjw7
   vdGzMrWhcJBukOF1bwzUtzKrm3uA3p58oXC2CTc8eK7Rh/drp70+2b7xs
   g==;
X-CSE-ConnectionGUID: kpvYkIvpQi+/1DK7SeooeQ==
X-CSE-MsgGUID: 96T65n6vTKCW4zqNY+Mtfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16620738"
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="scan'208";a="16620738"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 02:07:39 -0700
X-CSE-ConnectionGUID: z7JTCc8jTraYLUFTVJyaTg==
X-CSE-MsgGUID: n0wUDCEQQ1+VnShGI2+Whw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="scan'208";a="44738526"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 28 Jun 2024 02:07:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 52147374; Fri, 28 Jun 2024 12:07:36 +0300 (EEST)
Date: Fri, 28 Jun 2024 12:07:36 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: USB4/Thunderbolt maintenance on vacation during July
Message-ID: <20240628090736.GC1532424@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi all,

It is that time of the year again. Finland closes up due to vacations
and so does USB4/Thunderbolt maintenance. I will be offline during the
whole July but will be back in August. Everyone have a nice, relaxing
summer. See you again in August! :)

