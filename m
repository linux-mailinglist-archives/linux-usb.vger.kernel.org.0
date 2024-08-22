Return-Path: <linux-usb+bounces-13865-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0B795B3AD
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2024 13:24:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 160E61C227BA
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2024 11:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28EDC1C93B1;
	Thu, 22 Aug 2024 11:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YCtDibm2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D40F14A0B8
	for <linux-usb@vger.kernel.org>; Thu, 22 Aug 2024 11:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724325859; cv=none; b=VyHPZ+iHt0ZVMM5jbCvtOeWZDdyzCese8bM3iNLVAdlKNExp2DetKxTF2WB2gTXJLYMdd8mQFIbWh1BgoVBh0QIxaLPyhwhMFIQ4483vZGsfpIc233pluWMka+RKA9zI0VLFiLX3xhwhpRAD2mOTRu0JOQ3OBn/1jiii751FZlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724325859; c=relaxed/simple;
	bh=6QnJKbxmK2DDjllHuTecIv0YbOIJY8fdc+/cZiLQXuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fwNXDP0V9cek/lCyoxGybWZ7eoRM/boyOpRx8NX/KHRX2t89z3NOihfQp+8CZT1FYwmqlEvo9iM6VcdkOj+yPwpqwMJNRZlskljhrUS+lPz7/0tztZBiLcURYSlB3pHMVsQjEgL6IA/usBGwnx06om69/ozsuGOvrU4CLp31U+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YCtDibm2; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724325858; x=1755861858;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6QnJKbxmK2DDjllHuTecIv0YbOIJY8fdc+/cZiLQXuw=;
  b=YCtDibm2VqRZlKr5+fmNdaJGr35zxfQGYO9IvIPi/krBPljJizp+yU90
   iuJyL3xa3I2OnmNxuHLWDVqGURi42ocDkuvXl1WGfiQP5rs9pi3fIzGxR
   nKfjUCy/7mrOdPbUvky7czXk27V0gvg3DxIhrvpyKDgYRcVUOOVYFSWXz
   cd+/fOEygc+kdgHtwFawXDDugqL0BveO81i3VFcSvo+AhEfaGYFMcyAQ+
   Y+MAAGpyOGez/0nuNYE0JPWhvUStXk1lObS4RgAy8oFKqjn/6H4LVtPeR
   sEKSFA/tg5EEbepUbjvIIPFa1pggaHXXOAE0poEoeQRW7Ou08St4PhiOv
   Q==;
X-CSE-ConnectionGUID: Jxerf24ORsWI9hkTRRutfQ==
X-CSE-MsgGUID: UTstlIoITNqWfK3hwHI/Og==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="48125731"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="48125731"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 04:24:17 -0700
X-CSE-ConnectionGUID: 33AjcWIdR5qYr5w6wni/9w==
X-CSE-MsgGUID: ghODgC0DQBWGkh70CBIpgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="66299013"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orviesa005.jf.intel.com with SMTP; 22 Aug 2024 04:24:14 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 22 Aug 2024 14:24:12 +0300
Date: Thu, 22 Aug 2024 14:24:12 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-usb@vger.kernel.org,
	"Pilla, Siva sai kumar" <siva.sai.kumar.pilla@intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@google.com>,
	Bartosz Szpila <bszpila@google.com>
Subject: Re: [PATCH v2 1/6] usb: typec: ucsi: Remove unused fields from
 struct ucsi_connector_status
Message-ID: <Zscf3IXZuepUqqv6@kuha.fi.intel.com>
References: <20240816135859.3499351-1-heikki.krogerus@linux.intel.com>
 <20240816135859.3499351-2-heikki.krogerus@linux.intel.com>
 <CANFp7mUDm9Ya9Gjv9Bv_neL22SuDocmz_8HCGVbnd8y-0gd7tA@mail.gmail.com>
 <ZsMoUWSMtaxteBBf@kuha.fi.intel.com>
 <CANFp7mU69-4_v5JaycrPjt3ZnfyRa8PypFa=_gbuW9qW6_z9dw@mail.gmail.com>
 <ZsSWIQ7sMAeF9v9Y@kuha.fi.intel.com>
 <CANFp7mUB4oiyEfh4P5cOucvdaWaC5N=OwcVdZ0Wm8EKBf=Ss9w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANFp7mUB4oiyEfh4P5cOucvdaWaC5N=OwcVdZ0Wm8EKBf=Ss9w@mail.gmail.com>

Hi Abhishek,

I'm sorry to keep you waiting.

> You have me convinced on the "failing loudly" part but I'm still
> confused about the "how".
> 
> Making sure we always check versions to access the bits makes me think
> we need wrappers on casting to the rightly versioned connector status.
> Should we be versioning access for everything that's not in UCSI 1.2
> then?
> 
> Example:
> 
> struct ucsi_connector_status_raw {
>   u8 bytes[19];
> };
> 
> struct ucsi_connector_status_v1 {
>   ...
> };
> 
> struct ucsi_connector_status_v2 {
>   ...
> };
> 
> struct ucsi_connector_status_v1* get_connector_status_v1(struct
> ucsi_connector *con) {
>   return (struct ucsi_connector_status_v1 *)con->raw_status;
> }
> 
> struct ucsi_connector_status_v2* get_connector_status_v2(struct
> ucsi_connector *con) {
>   return con->ucsi->version >= UCSI_VERSION_2_0 ? (struct
> ucsi_connector_status_v2 *)&con->raw_status : NULL;
> }
> 
> /* Read all bits supported by the current version. */
> int ucsi_read_connector_status(struct ucsi_connector *con, struct
> ucsi_connector_status_raw *raw_conn_status);

I'll take a look at this next week. Right now I have to focus on
other tasks.

Br,

-- 
heikki

