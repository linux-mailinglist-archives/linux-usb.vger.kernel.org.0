Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 354677436C3
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jun 2023 10:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232097AbjF3INz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Jun 2023 04:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231455AbjF3INy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Jun 2023 04:13:54 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DBC61997
        for <linux-usb@vger.kernel.org>; Fri, 30 Jun 2023 01:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688112833; x=1719648833;
  h=date:from:to:subject:message-id:mime-version;
  bh=dhaucDXyp7PSnL96rOjeIE4HKvXJgjpvgyIKXLuZBXk=;
  b=MBP/07Fm8BZpOAFY1adWk9Mu8DCDuvpFEnMP7JJZBbEfSItx9mqRYi/L
   Be4n7Yr3U55gMbSngxihycGJe4mMhKqRGePPWlq3P3cM8WJPMIUQA1sio
   C61MSMz8s3+HDwDDQQO2kKAz80GWjoIfG6Nv+t1wG1+n0dv/INRSSo7RY
   C0mB0G92pZpKL5c0h/jb4u93nOrQrVmRKrGJYHQHgMF+L9XHvQP+5FkrG
   FaFJS6qrAm0J0LjmsBFJa10ew8i3bDdEPlarjB0S7Xqmqth8IcQF6ehrX
   lj/xOOO4l4C0mw2EnunjHwEtBxUlb4xkJbMQHjcdheqJl67LxYwYXwZTB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="428385127"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="428385127"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 01:13:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="667858173"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="667858173"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 30 Jun 2023 01:13:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 8B4013DA; Fri, 30 Jun 2023 11:13:50 +0300 (EEST)
Date:   Fri, 30 Jun 2023 11:13:50 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Subject: Thunderbolt/USB4 maintenance on vacation during July
Message-ID: <20230630081350.GR14638@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dear all,

It is that time of the year again :) Finland is pretty much closing up
as people are heading for a well deserved vacation during the July. This
puts the Thunderbolt/USB4 into "vacation mode" too but I will be back in
August gathering whatever was sent to me.

I wish everyone good summer, remember to relax! See you again in August :)

Cheers!
