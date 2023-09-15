Return-Path: <linux-usb+bounces-137-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C217A1D21
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 13:12:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CC911C20BFC
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 11:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F4CD101DE;
	Fri, 15 Sep 2023 11:12:33 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050DD101C7
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 11:12:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11766101
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 04:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694776351; x=1726312351;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o8OiRiPbRlN/T3zx03c7liWSdJxgJvZI0GGT/VOSk/0=;
  b=kmYB0dtoQt6wpQOrvG1RRjTRGeEpNB7R5CIjFVlIrU9BfzMz+1ITrPk2
   q/CzmBSivx6Dgq4xgeUSDISmVD8hdP2NiNLc4aW4ZU1dHbZg4tTyemy+B
   PyKLVpmBJmO7wMRIvTVBV7przwySXT0oatLKvOZqr1nRKuQeIpWdw7Ofx
   3luMJy9RSiiAnNkjuxLP6B+T8MiFGN7RDGYzKTB8oemUDmzKtcuS8w1aD
   OVw+lCq5seT1rgp+tMKehub3a+RZCvDDE1gLk8s8jW8VWigqvSCXu49oT
   rl81gkE913mQOZVryVFGSxDmmVTXpCqwqkv6kNtpH81MxC41MAG8jwdF2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="410161803"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="410161803"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 04:12:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="774275870"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="774275870"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 15 Sep 2023 04:12:27 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 397D58C9; Fri, 15 Sep 2023 14:12:25 +0300 (EEST)
Date: Fri, 15 Sep 2023 14:12:25 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Konrad J Hambrick <kjhambrick@gmail.com>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Werner Sembach <wse@tuxedocomputers.com>,
	Calvin Walton <calvin.walton@kepstin.ca>,
	Marek =?utf-8?B?xaBhbnRh?= <teslan223@gmail.com>,
	David Binderman <dcb314@hotmail.com>,
	Alex Balcanquall <alex@alexbal.com>
Subject: Re: [PATCH 0/5] thunderbolt: Couple of fixes and improvements
Message-ID: <20230915111225.GQ1599918@black.fi.intel.com>
References: <20230911100445.3612655-1-mika.westerberg@linux.intel.com>
 <20230915101023.GP1599918@black.fi.intel.com>
 <CANBHt+PT9S59C-4S4riUm03fs2RKGwfVKM6i20=YUN5_-FSnWg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CANBHt+PT9S59C-4S4riUm03fs2RKGwfVKM6i20=YUN5_-FSnWg@mail.gmail.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi,

On Fri, Sep 15, 2023 at 06:00:39AM -0500, Konrad J Hambrick wrote:
>    Is there something you would like to have tested in this set of patches ?

No need, you already provided all the necessary information on the
bugzilla! Thanks a lot for testing! :)

