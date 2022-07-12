Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6825571910
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jul 2022 13:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232635AbiGLLyY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jul 2022 07:54:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230482AbiGLLyL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Jul 2022 07:54:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67281B6297
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 04:53:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E03276155D
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 11:53:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23CDDC3411C;
        Tue, 12 Jul 2022 11:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657626791;
        bh=SjsyX64Kh5U6Xkiu/IiiEHA0fldnmoKAIaf5KYOsXw0=;
        h=From:To:Cc:Subject:Date:From;
        b=KonHjXIE3odLLPbmw6KKsmTGbojRJNLIcrMzZ4ZrXJBe58d6rsve1TNzvN9u0Jyl9
         q19VCeB18m7ipxyQEJy/28CYRab4rM1oV8Zw8IqdDFhJlcO0NXM7LeH5FVTRW5zOhO
         HOHxRXJCl3VrZlfdXbPHwEiZuWBELdCFn0HeDHBvLwZ/q8JREW1Wnx+Jv3pVScZDz8
         g2WFkFqWm50XZFkwUn0J+YiHMoOPdJgWH/QPtv2Th+mJqEvU7DQ0nb44F4oeI9GF4U
         MpVOFeXq06nNKAR6xKBhCVcIDHd/X/45KDggJ4qv50PA/6ZB9EG3gLN2s4RCNMejoV
         mOSc15cIY6twA==
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH v2 0/7] ftdi_sio driver improvements
Date:   Tue, 12 Jul 2022 13:52:59 +0200
Message-Id: <20220712115306.26471-1-kabel@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi guys,

Pali has worked out some improvements for the ftdi_sio USB serial
driver and I have reviewed and tested them.

Changes since v1:
- addressed issues pointed out by Greg: better commit messages,
  fixed checkpatch warning, dropped usage of (u32)-1

Pali Rohár (7):
  USB: serial: ftdi_sio: Fix divisor overflow
  USB: serial: ftdi_sio: Add missing baud rate validation
  USB: serial: ftdi_sio: Extract SIO divisor code to function
  USB: serial: ftdi_sio: Do not reset baud rate to 9600 Baud on error
  USB: serial: ftdi_sio: Fix baud rate rounding for ASYNC_SPD_CUST
  USB: serial: ftdi_sio: Fix custom_divisor and c_*speed for
    ASYNC_SPD_CUST
  USB: serial: ftdi_sio: Fill c_*speed fields with real baud rate

 drivers/usb/serial/ftdi_sio.c | 187 ++++++++++++++++++++++++++++------
 1 file changed, 156 insertions(+), 31 deletions(-)

-- 
2.35.1

