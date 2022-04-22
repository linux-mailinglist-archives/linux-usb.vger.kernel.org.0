Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9A0450ADB3
	for <lists+linux-usb@lfdr.de>; Fri, 22 Apr 2022 04:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383619AbiDVCZU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Apr 2022 22:25:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231551AbiDVCZT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Apr 2022 22:25:19 -0400
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 509CA49698
        for <linux-usb@vger.kernel.org>; Thu, 21 Apr 2022 19:22:28 -0700 (PDT)
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5449941EE3;
        Fri, 22 Apr 2022 02:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1650594147; bh=Mp91rber0KUFB4fdJ8KtaBivx1nJBvDRjcvmhAxBTYM=;
        h=Date:From:Subject:To:Cc:From;
        b=Z51gkwWlOa8hWYikPclNoFwHu57MGXkS0vXKgtNX7s8deq3t/r0+RlyT7mCiT1Gch
         hyMIvd1eaFBFESYAoPPT+RNaadtD86oisEiv5+HgLXYltYnmTfWsmbkziHzno71Nmu
         MR+buKxWYRBzGK5Y/0V2408M+hcLbnuFvQypkNU8Cd38zoq5EEmQFRhnMJC68pAUXc
         HE/wGLsl25BoujWFHi2ZFxjtrxyevxnIlv9uzDvMNXm7N5wuxIjQ7w9FLJ82uGoU28
         0Av3oJNyiVEQqjRncQ0QQPNPgamngu8f6jXgG9QZLmwJq7mW0iOJ1taKpa4YZGzheh
         VyaNPs1AjUomg==
Received: from te-lab16-v2 (nanobot.internal.synopsys.com [10.204.48.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 5BBF0A006D;
        Fri, 22 Apr 2022 02:22:24 +0000 (UTC)
Received: by te-lab16-v2 (sSMTP sendmail emulation); Thu, 21 Apr 2022 19:22:24 -0700
Date:   Thu, 21 Apr 2022 19:22:24 -0700
Message-Id: <cover.1650593829.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 0/6] usb: dwc3: gadget: Rework pullup
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series cleanup and enhance dwc3 pullup() handling to cover different
corner cases.

Would be great to have some Tested-by before picking this series up. Thanks!


Thinh Nguyen (6):
  usb: dwc3: gadget: Prevent repeat pullup()
  usb: dwc3: gadget: Refactor pullup()
  usb: dwc3: gadget: Don't modify GEVNTCOUNT in pullup()
  usb: dwc3: ep0: Don't prepare beyond Setup stage
  usb: dwc3: gadget: Only End Transfer for ep0 data phase
  usb: dwc3: gadget: Delay issuing End Transfer

 drivers/usb/dwc3/ep0.c    |   2 +-
 drivers/usb/dwc3/gadget.c | 126 ++++++++++++++++++++------------------
 2 files changed, 69 insertions(+), 59 deletions(-)


base-commit: 5c29e864999763baec9eedb9ea5bd557aa4cbd77
-- 
2.28.0

