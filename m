Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1D6E56186A
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jun 2022 12:39:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234960AbiF3Kis (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jun 2022 06:38:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233783AbiF3Khr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Jun 2022 06:37:47 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CAD75239A
        for <linux-usb@vger.kernel.org>; Thu, 30 Jun 2022 03:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656585453; x=1688121453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d8JbVzej0UDhEGb/C0+nfILSP7Vj2x9bPgU00GsCkII=;
  b=DwivRmzp9u2As7Z4S6xaVhX+y15o5UvFS9cqTzliGcU6ww/VC3Qyy6cD
   H3vECqcepfsOC9Rj8883tCHequ3ikkWx37zJOTuYUQcYStXozbjyeoZUh
   ycY13tqRk7Gm/S5iP7MnSds/ZbFXxSmHZVz/D743J+cIf8zc0y3L8q4S+
   /0mcIJ3evBQz9CzdHOyfmhviFHV4zS5UMhPVPjbxKyqqF3KstxFB4X87N
   pShvNcczteu0Rv/rvaf0OttPItcJJyt5z2W/xjndRMReajXZiiHjsuYdd
   6z8c35eK8GmQAHKFYNk+1EE4NQlXjWCrCp1+gH5FkJTkarr9RPwrrXTvb
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="271080717"
X-IronPort-AV: E=Sophos;i="5.92,234,1650956400"; 
   d="scan'208";a="271080717"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2022 03:37:32 -0700
X-IronPort-AV: E=Sophos;i="5.92,234,1650956400"; 
   d="scan'208";a="680926078"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2022 03:37:30 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 30 Jun 2022 13:37:25 +0300
Date:   Thu, 30 Jun 2022 13:37:25 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>
Cc:     linux-usb@vger.kernel.org
Subject: Thunderbolt/USB4 maintenance on vacation during July
Message-ID: <Yr185R656uozcS25@lahna>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

I will be on vacation the whole July and most of that time completely
offline. The v5.20 material is already sitting in Greg's tree. Once I
return I will go through any patches sent during my vacation and pick
them up accordingly.

Thanks!
