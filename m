Return-Path: <linux-usb+bounces-9769-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 441E88B1F60
	for <lists+linux-usb@lfdr.de>; Thu, 25 Apr 2024 12:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F114D282F77
	for <lists+linux-usb@lfdr.de>; Thu, 25 Apr 2024 10:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731591DDC9;
	Thu, 25 Apr 2024 10:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BR+cxdgS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A45C182AE
	for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2024 10:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714041621; cv=none; b=YFRbl54m7ZY9u+gzyz4r5/CUr0Z/xgAa5CR6gJAQAzXcuRrlGXT61lewXGkrRkQBCQ6sQKMht89FITr3symYmSC/r99tpFiOliQg9tzhQmz+msCOqE5XCqyTeCWEwzrPYTEO05IcnMqociJJ7iNd4oLu3Vpwzv2b9ETWuU2aoQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714041621; c=relaxed/simple;
	bh=twl5pJb/MuOooCNRdo2nfd6gd0YLfBvzkOTa0HuI1sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G1Oma+FXFHbw+w7GHISHK1XoGiugXTWVxO83JTg6pi2CDv9aNh45FcNjaL74S/jq+dRk+QKRWr5wj3sF9N7TpLKcXsdLIyT5ucsw7SsSgu5Lv42JfSljruFppilP2DFXMGBSCVDsl/A9RR3C3M8zAdb7AX/0XobTh9ij/a1NlB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BR+cxdgS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714041620; x=1745577620;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=twl5pJb/MuOooCNRdo2nfd6gd0YLfBvzkOTa0HuI1sw=;
  b=BR+cxdgSge4B2jp1eMd3+dJ8NwbEsAkEJuuhATxCHqI0IQRi1q54sbJZ
   vhyG32hjrnymqz+gBYTZ0Qa+QkbCL6zrNco+DyRYpM+zNTG9NY5PNHmjt
   BzXKOY7F8eOykS022iMjlrxj90tgb45ydeje7QyvkpMNXgDGpHVbm5YTH
   1x/3nMnj4pinw3z22bzj7IyIyHT4Nj6doIH959Bf4Wyd4JdSGzlKNrG0V
   Mrxz13S/IOBo/6dpNGBqZazdiXL0yupUEcJSfz0iagDqKKmEljw28xdfq
   MWlKrovaGAtjvEKmvr5TOpG4FfN+vhkwvrykonneCu9QBhVeP/eeXHlZ1
   w==;
X-CSE-ConnectionGUID: Cq62dxqnRIOGGnbt2Dhz1Q==
X-CSE-MsgGUID: pUUQ7aTKSjalaUyLFWl8cw==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="20332599"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="20332599"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 03:40:19 -0700
X-CSE-ConnectionGUID: A63E+jsMQ06lPEMdQ6ck3g==
X-CSE-MsgGUID: Ywv/rDT3T8ab7C8Eam+x4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="55975689"
Received: from ccdjpclinux26.jer.intel.com (HELO localhost) ([10.12.48.253])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 03:40:18 -0700
Date: Thu, 25 Apr 2024 13:43:18 +0300
From: Gil Fine <gil.fine@linux.intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gil.fine@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [bug report] thunderbolt: Allow USB3 bandwidth to be lower than
 maximum supported
Message-ID: <ZiozxqBpYjQ4RdPZ@ccdjLinux26>
References: <6289898b-cd63-4fb8-906a-1b6977321af9@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6289898b-cd63-4fb8-906a-1b6977321af9@moroto.mountain>
Organization: Intel Israel Jerusalem (IDPj /IDCj) Har Hotzvim, HaMarpe Street
 9, Zip code 9777409

Thanks Dan for the report !
This is indeed a bug and will be fixed in the subsequent kernel.
Have a nice day,
Gil

On Wed, Apr 17, 2024 at 03:52:34PM +0300, Dan Carpenter wrote:
> Hello Gil Fine,
> 
> Commit 25d905d2b819 ("thunderbolt: Allow USB3 bandwidth to be lower
> than maximum supported") from Feb 12, 2024 (linux-next), leads to the
> following Smatch static checker warning:
> 
> 	drivers/thunderbolt/tunnel.c:2113 tb_tunnel_alloc_usb3()
> 	error: uninitialized symbol 'max_rate'.
> 
> drivers/thunderbolt/tunnel.c
>     2061 struct tb_tunnel *tb_tunnel_alloc_usb3(struct tb *tb, struct tb_port *up,
>     2062                                        struct tb_port *down, int max_up,
>     2063                                        int max_down)
>     2064 {
>     2065         struct tb_tunnel *tunnel;
>     2066         struct tb_path *path;
>     2067         int max_rate;
>     2068 
>     2069         if (!tb_route(down->sw) && (max_up > 0 || max_down > 0)) {
>                                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> The patch adds this condition.  If both of these are <= 0 then
> max_rate is uninitialized.
> 
>     2070                 /*
>     2071                  * For USB3 isochronous transfers, we allow bandwidth which is
>     2072                  * not higher than 90% of maximum supported bandwidth by USB3
>     2073                  * adapters.
>     2074                  */
>     2075                 max_rate = tb_usb3_max_link_rate(down, up);
>     2076                 if (max_rate < 0)
>     2077                         return NULL;
>     2078 
>     2079                 max_rate = max_rate * 90 / 100;
>     2080                 tb_port_dbg(up, "maximum required bandwidth for USB3 tunnel %d Mb/s\n",
>     2081                             max_rate);
>     2082         }
>     2083 
>     2084         tunnel = tb_tunnel_alloc(tb, 2, TB_TUNNEL_USB3);
>     2085         if (!tunnel)
>     2086                 return NULL;
>     2087 
>     2088         tunnel->activate = tb_usb3_activate;
>     2089         tunnel->src_port = down;
>     2090         tunnel->dst_port = up;
>     2091         tunnel->max_up = max_up;
>     2092         tunnel->max_down = max_down;
>     2093 
>     2094         path = tb_path_alloc(tb, down, TB_USB3_HOPID, up, TB_USB3_HOPID, 0,
>     2095                              "USB3 Down");
>     2096         if (!path) {
>     2097                 tb_tunnel_free(tunnel);
>     2098                 return NULL;
>     2099         }
>     2100         tb_usb3_init_path(path);
>     2101         tunnel->paths[TB_USB3_PATH_DOWN] = path;
>     2102 
>     2103         path = tb_path_alloc(tb, up, TB_USB3_HOPID, down, TB_USB3_HOPID, 0,
>     2104                              "USB3 Up");
>     2105         if (!path) {
>     2106                 tb_tunnel_free(tunnel);
>     2107                 return NULL;
>     2108         }
>     2109         tb_usb3_init_path(path);
>     2110         tunnel->paths[TB_USB3_PATH_UP] = path;
>     2111 
>     2112         if (!tb_route(down->sw)) {
> --> 2113                 tunnel->allocated_up = min(max_rate, max_up);
>                                                     ^^^^^^^^
>     2114                 tunnel->allocated_down = min(max_rate, max_down);
>                                                       ^^^^^^^^
> Uninitialized.
> 
>     2115 
>     2116                 tunnel->init = tb_usb3_init;
>     2117                 tunnel->consumed_bandwidth = tb_usb3_consumed_bandwidth;
>     2118                 tunnel->release_unused_bandwidth =
>     2119                         tb_usb3_release_unused_bandwidth;
>     2120                 tunnel->reclaim_available_bandwidth =
>     2121                         tb_usb3_reclaim_available_bandwidth;
>     2122         }
>     2123 
>     2124         return tunnel;
>     2125 }
> 
> regards,
> dan carpenter

-- 
Thanks,
Gil

