Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA2781CFE3E
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2020 21:25:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730729AbgELTZm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 May 2020 15:25:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbgELTZm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 May 2020 15:25:42 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EFE9C061A0C
        for <linux-usb@vger.kernel.org>; Tue, 12 May 2020 12:25:42 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id y16so10022335wrs.3
        for <linux-usb@vger.kernel.org>; Tue, 12 May 2020 12:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=8D1Run63e6JS8ZGmeoR75zwVHbpyRePC3ZCy/7kyGaE=;
        b=P7VczGW0X68E2b7TqK3kxmkNBAVU7OlKzb48ftTRPO6WE39+YS6h0M4Atus1Rqy4Qe
         2cLJBkBuPyVdvgiCfEplaXA5jYqaMpjokKSPJXnXQBmOwUs2B3BAMXXe/Mwe5Dz7656o
         J9sewbx7iAaJBDc6xRq5Sbhd6lD4xljLCboldy7YjbZxhcwSpWposbIaSiskGZkiJ2CJ
         KAKmmX7hiZ+9jBoMr7/bNiPByo4vAtlrKwa9KiEAn3jL3lwoFWB2K/lpXjzKQi4NUv+d
         E1jFOw/3fxMEzUEEpj0ypVxYzY4p91Is8yHaHTVWJPhAWrRoJiW0AvkaQuGxJzT1O9Li
         GqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=8D1Run63e6JS8ZGmeoR75zwVHbpyRePC3ZCy/7kyGaE=;
        b=QebTR8snQVWPkwpfvhB7XIj8FA9tNEdho5zvoTPX3yT1Mo40WQ+mzNvrFYVfyUMDF7
         +6peyl0gi+dJ6cPjCQM0H4TDlAwkPRa5FI9o/PQ42dr/1rVf7lJ/I7WoPqAeC1yCfbYG
         zOOX4tu3xwkSlrYYq+ir3ctPNWubxSlokoxADpn0D/q5SmtLmYi97l3iiZCPVl1zT6Zo
         X/ntvJcbgX4jZC3H9Z8wqnDQqbf3/ttCjFDvnKv56ENVwdtRK92zw49znvObMDxtWlp+
         4HK8D5ymL/8LGo6stQJee/RBq3Cj9zHeHGtSdDT9hjT4i3IiXIT3x6J0JaGcHar0vAeI
         xH2Q==
X-Gm-Message-State: AGi0PuZHhxxo0JCTFMvnfEBxvemIWydT+uTZAfCWp7bcBMjZN5YWphCo
        TSsaohBhMRH5Zodi9alOOijz80l0
X-Google-Smtp-Source: APiQypLrgktjMMNKqvYZkd0/Tyt/Yw2s581wdcuTWFcxrkK9BzkgsLYC9JucqbFmwIkHfze12JRBmQ==
X-Received: by 2002:adf:f84c:: with SMTP id d12mr10265208wrq.248.1589311540538;
        Tue, 12 May 2020 12:25:40 -0700 (PDT)
Received: from [192.168.1.41] (2-108-107-206-static.dk.customer.tdc.net. [2.108.107.206])
        by smtp.gmail.com with ESMTPSA id a7sm31657681wmj.12.2020.05.12.12.25.39
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 12:25:39 -0700 (PDT)
Message-ID: <8943a225c6d8354f2f5fe0ea7270dc0fa1293180.camel@gmail.com>
Subject: Options for forcing dwc3 gadget to only accept superspeed
From:   Claus Stovgaard <claus.stovgaard@gmail.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Tue, 12 May 2020 21:25:38 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all

I have a system, using a Xilinx ZynqMP with kernel 4.19, using the
build in dwc3 core as a USB device. (It is a custom device using
ConfigFS / FunctionFS).

In a certain scenario I would like to force the dwc3 to only connect
via superspeed and not fall back to USB2.

What options exist for forcing the dwc3 to keep retry?

I know about the U2RSTECN from GCTL -
https://www.xilinx.com/html_docs/registers/ug1087/usb3_xhci___gctl.html

So was wondering if other options existed, where I can force it to
continue try to connect as SuperSpeed.

Or if it is possible to setup the high speed descriptors for ffs, so
the host automatically will reset the bus / device so it newer will be
reported as connected, unless it is with super speed.

Thanks ahead.

Claus Stovgaard

