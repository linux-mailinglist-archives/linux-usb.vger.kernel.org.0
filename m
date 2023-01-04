Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1701965D7E1
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jan 2023 17:07:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235318AbjADQHv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Jan 2023 11:07:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239765AbjADQHl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Jan 2023 11:07:41 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C87A41705F
        for <linux-usb@vger.kernel.org>; Wed,  4 Jan 2023 08:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672848459; x=1704384459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s+1nuf3C4WsLY+usiaLFtXuFHkZ7W98U28OQy5b2ud4=;
  b=Deh8wDfXln9mp+cSYXRFxndfS+fUuePO/upUEZqdWjQ3b4alUKvlF1ax
   xfndFohtONfGuLefAIE+B65PvHLd1cmdzPlPcqCTi4SnIMffMEOsPqy20
   eiEp/HW6BJdH3/PJwAnDDiJO2lne6QLpjIJ6UDzqAqr5DNgV2WR41E9xn
   Hvzqz8LlSpB3ZtavgmU6fMAOvnPGQazytIRCatZgOHUJIV16qxbdVNrc4
   kWPoY8VqZXJIrg+SKWkMfZ40oSGFso3rva8WCLKCFKFwF0DwRfGDjNpD0
   snF/XTeMX4vYfZkjVyu9XTy7ArXy1kVrxaOTG4URN5Kz2f/rB8BgdguDR
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="309734430"
X-IronPort-AV: E=Sophos;i="5.96,300,1665471600"; 
   d="scan'208";a="309734430"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2023 08:07:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="797589217"
X-IronPort-AV: E=Sophos;i="5.96,300,1665471600"; 
   d="scan'208";a="797589217"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 04 Jan 2023 08:07:24 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 04 Jan 2023 18:07:23 +0200
Date:   Wed, 4 Jan 2023 18:07:23 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: The "bus for gadgets" is preventing the use of multiple UDCs
Message-ID: <Y7WkOwcNYl2mWyiW@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Before the introduction of this bus it was possible to use configfs
with multiple device controllers:

        echo "dwc3.1.auto" > usb_gadget/g1/UDC
        echo "dwc3.2.auto" > usb_gadget/g2/UDC

But now only one UDC can be assigned. When I try to assign the second
UDC for g2, I get this error:

        Error: Driver 'configfs-gadget' is already registered, aborting...
        UDC core: g2: driver registration failed: -16

thanks,

-- 
heikki
