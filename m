Return-Path: <linux-usb+bounces-7327-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A757186C93D
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 13:30:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 445B71F22E21
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 12:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED19A33FE;
	Thu, 29 Feb 2024 12:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QqSVV9l8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77BB13D2F2
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 12:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709209850; cv=none; b=MSHmDXC/kGmc7lId8gsZoYTdRDk6uarJXZAsRHBN9+v5Cdxc2yC16kCH9ybQowbO3sN0P0MGeLbSR4w4zBWNHfaWvyr4feT9U8/N6YzLu2kvasm0rO5vqB4DpCIYillQyYADiFr36OPjC5tuXdlnaMdxVQ/bOnypPfSxK3BBjgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709209850; c=relaxed/simple;
	bh=UaNAS7qsYXutX8VrEaA+DBPiykKiQaVMzpmpUzsbd0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sIPlda/LCxS45Cur0foeHdJcqjQ2zCB+hKm65kFfxG1ThstQ4IItU1ErpYSIG3zn0hDJJ/xBfTFXcPi8F0HVDilhjIMh8oxeaPGrjA73sIlFKAmZN5KzA8P7I2Q27f0FXW6s/vuEH180B1fGRx0wd/mcOIx8mWDxVojgDbHac5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QqSVV9l8; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709209848; x=1740745848;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=UaNAS7qsYXutX8VrEaA+DBPiykKiQaVMzpmpUzsbd0o=;
  b=QqSVV9l8jomKv5hCY4yaVSyT44lOlMpmpytpF6lDabxtA7pEHCrMTkbz
   oGugZ0Eriz3hrH7CsrQabP4CCd4ke3+NDZp78aEWSOSdjLZxcmmT2sQJw
   EwEHgXQwzb0HPfM96ANzB0zY+/9Jlq5ZWRgMd2YRFuTSJ8zBeKBmXIPX5
   ACtAOWTEMCTTcMml9aT+RQK7Ng1SefoyKjfWIGgcspQNLDtqvbvdLHr2H
   NJN/Y37ZUeTxg4Vy8174BimpszgWuwYd3l0fKPyOmNBJW8/IT4NSSXx8S
   8u6a4jjRk1YtvPbBB1heLzoI5HK0psiy01jN410o5FVO7ntxRdvUD9Zj+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="15090224"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="15090224"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 04:30:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="937035872"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="937035872"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 29 Feb 2024 04:30:43 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id B09363BC; Thu, 29 Feb 2024 14:30:42 +0200 (EET)
Date: Thu, 29 Feb 2024 14:30:42 +0200
From: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
To: "mohamed.rayan@siemens.com" <mohamed.rayan@siemens.com>
Cc: "andreas.noever@gmail.com" <andreas.noever@gmail.com>,
	"michael.jamet@intel.com" <michael.jamet@intel.com>,
	"YehezkelShB@gmail.com" <YehezkelShB@gmail.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"mohamed.samy@siemens.com" <mohamed.samy@siemens.com>,
	"mohamed.el_nahas@siemens.com" <mohamed.el_nahas@siemens.com>,
	"ahmed_mohammed@siemens.com" <ahmed_mohammed@siemens.com>
Subject: Re: Inquiry about tb/usb4 driver
Message-ID: <20240229123042.GH8454@black.fi.intel.com>
References: <SEZPR06MB5439E9D11593D4550BDCA4AFF35F2@SEZPR06MB5439.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SEZPR06MB5439E9D11593D4550BDCA4AFF35F2@SEZPR06MB5439.apcprd06.prod.outlook.com>

Hi,

On Thu, Feb 29, 2024 at 12:18:31PM +0000, mohamed.rayan@siemens.com wrote:
>    Hello,
> 
>     
> 
>    Hope this mail finds you well,

It does but sending HTML has some issues if the receiver such as me uses
text based mail client ;-)

>    I am sending this mail asking you for some help in the usage of tb/usb4
>    driver,
> 
>    I have downloaded this driver for kernel v6.5 to install it with a certain
>    USB4 host controller, Here is the driver link:
>    [1]https://elixir.bootlin.com/linux/v6.5/source/drivers/thunderbol
> 
>     
> 
>    I have found something not clear to me in “switch.c”, and exactly at line
>    #2260: “[2]tb_switch_alloc”, which is responsible for allocating and
>    initialization a switch:
> 
>  1-    This function has a local variable called “upstream_port”
> 
>  2-    A “tb_cfg_get_upstream_port” is first called to get the value of “upstream_port” from Switch config space
> 
>  3-    When I checked “tb_cfg_get_upstream_port” function, I found that it reads first DW (DW#0) of the router configuration space
> 
>  4-    In USB4 standard specifications, the first DW of the router config space is Vendor/Product IDs, not the Upstream Adapter, please check the below snapshot from USB4 standard
> 
>  5-    Later in the code of the “[3]tb_switch_alloc” function, at line#2297, this value of “upstream_port”  is used to overwrite another variable in the struct as follow:
> 
>                  
> 
>   
> 
>   
> 
>   
> 
>  6-    So at the end, “sw->config.upstream_port_number” will get updated with incorrect settings, So I am wondering if this is an expected behavior, Am I missing something?

This is historic to support Thunderbolt 1-3 devices where the upstream
port could change. In USB4 routers it is read-only. Do you see any real
issue with this?

