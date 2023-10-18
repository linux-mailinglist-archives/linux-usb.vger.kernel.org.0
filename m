Return-Path: <linux-usb+bounces-1844-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2C17CD551
	for <lists+linux-usb@lfdr.de>; Wed, 18 Oct 2023 09:11:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0592A2811A8
	for <lists+linux-usb@lfdr.de>; Wed, 18 Oct 2023 07:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D7010A36;
	Wed, 18 Oct 2023 07:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j0ZfiF21"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00F27493;
	Wed, 18 Oct 2023 07:10:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A0D91B4;
	Wed, 18 Oct 2023 00:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697613054; x=1729149054;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2f5KGCkoKZZ5JhVOJVIHD3+5S1y0Tlk1F+D7jYqUrJ8=;
  b=j0ZfiF21quykqhMxRY1qotzbhVjUK/Pak7HAsfBUlUIgNXsog+aOJZVJ
   1ERkvQAv8v0LASphIxjpB80kc+oXJiameRed7GBDnU4AhXKUj2wAmfnik
   vp0RZ5hDXTemYAwLljaNxX2trdfnRqHI9ZOspcRFaQR1kwoUKE3HPasIO
   CICzL/bWjDfdPdCg8nPVoHSOuehDt7O+au8MQ2sv2PJT9C+vKznD7nMYh
   nizfXy7ODXvfE1vw6vaRBj2bMltXJt+Xywk5ahKdoHnEPL+3SiIwjUBws
   4laElsV8poqIhLL65TDTbbfAB5PZnJzq2nIyngaUQzEWuw0vvJIWQUHR7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="376326405"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="376326405"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 00:10:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="785775403"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="785775403"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orsmga008.jf.intel.com with SMTP; 18 Oct 2023 00:10:48 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 18 Oct 2023 10:10:47 +0300
Date: Wed, 18 Oct 2023 10:10:47 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] usb: typec: fsa4480: Add support to swap SBU
 orientation
Message-ID: <ZS+E91QLqCwrhdTG@kuha.fi.intel.com>
References: <20231013-fsa4480-swap-v1-0-b877f62046cc@fairphone.com>
 <20231013-fsa4480-swap-v1-2-b877f62046cc@fairphone.com>
 <ZS5NV43MhD3YNeDX@kuha.fi.intel.com>
 <CWAMY8EP9RN1.VPH5E7Z1T7JN@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CWAMY8EP9RN1.VPH5E7Z1T7JN@fairphone.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi Luca,

> > Shouldn't you loop through the endpoints? In any case:
> >
> >         ep = fwnode_graph_get_next_endpoint(dev_fwnode(&fsa->client->dev, NULL));
> 
> The docs only mention one endpoint so I'm assuming just next_endpoint is
> fine?

I'm mostly concerned about what we may have in the future. If one day
you have more than the one connection in your graph, then you have to
be able to identify the endpoint you are after.

But that may not be a problem in this case (maybe that "data-lanes"
device property can be used to identify the correct endpoint?).

We can worry about it then when/if we ever have another endpoint to
deal with.

thanks,

-- 
heikki

