Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 213B0599D63
	for <lists+linux-usb@lfdr.de>; Fri, 19 Aug 2022 16:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349148AbiHSOOe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Aug 2022 10:14:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348475AbiHSOOd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Aug 2022 10:14:33 -0400
X-Greylist: delayed 1236 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 19 Aug 2022 07:14:30 PDT
Received: from 86-87-4-113.fixed.kpn.net (2a02-a463-143f-1-215-5dff-feb2-1f00.fixed6.kpn.net [IPv6:2a02:a463:143f:1:215:5dff:feb2:1f00])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF15338A7
        for <linux-usb@vger.kernel.org>; Fri, 19 Aug 2022 07:14:30 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by 86-87-4-113.fixed.kpn.net (Postfix) with ESMTP id 218A1803E5
        for <linux-usb@vger.kernel.org>; Fri, 19 Aug 2022 15:53:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at biabv.com
Received: from 86-87-4-113.fixed.kpn.net ([IPv6:::1])
        by localhost (newyork-ubuntu.fritz.box [IPv6:::1]) (amavisd-new, port 10024)
        with ESMTP id hhz2reNtvLE2 for <linux-usb@vger.kernel.org>;
        Fri, 19 Aug 2022 15:53:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=biabv.com; s=default;
        t=1660917222; bh=vnoINkgZHjmFUuTtLCF7PewIk9YQd6j5IaySBoMCp8A=;
        h=From:To:Subject:Date:From;
        b=flg+GzUTKSN+Jr5HM47wVExgVG4zMn4Y+J/sOtgEzJikuKSa8TwIIXbzdi5mvbSX4
         /7ZVThsrg0c+OWIY6Kq2+sKrrFeZCiWaNk7atSCog3ZYPwo3ylqfqrh0gIeTCjqFua
         Q/WwwnHi9M8YCfKLLX09xDUj8seAN8cZgERGJomQ126ZANKR3B5Vnjv1ZT3aiC5tI1
         NQMUtx0Aal+lujCxWqHzXMEp9Sw1grsCJqB3a8OKETHVMr0qEaLbYYAEy632NbZupU
         X28MNb41i7ZOe8nUlfLBkF1h+CrhcxeXmBlwrPYkuo5Qdow4R0Nygev6VlrR1Ve1oh
         buxv78+J5GAsg==
From:   <frans@biabv.com>
To:     <linux-usb@vger.kernel.org>
Subject: tools/usb/usbip reports errors based on uninitialized value
Date:   Fri, 19 Aug 2022 15:53:36 +0200
Message-ID: <02c301d8b3d3$17a4d760$46ee8620$@biabv.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: nl
X-Spam-Status: No, score=3.4 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HELO_DYNAMIC_IPADDR2,
        SPF_HELO_NONE,SPF_PASS,TVD_RCVD_IP,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Consider handling the 'usbip list' command:

Here an uninitialized 'status' variable is declared:
https://github.com/torvalds/linux/blob/master/tools/usb/usbip/src/usbip_list
.c#L54

'status' is provided as an output variable here:
https://github.com/torvalds/linux/blob/master/tools/usb/usbip/src/usbip_list
.c#L62

However, 'usbip_net_recv_op_common' (defined here:
https://github.com/torvalds/linux/blob/master/tools/usb/usbip/src/usbip_netw
ork.c#L162) can fail and return for several reasons before setting 'status'.

The caller uses 'status' (which is still uninitialized) to report an error
text here:
https://github.com/torvalds/linux/blob/master/tools/usb/usbip/src/usbip_list
.c#L65

This leads to random error messages. Sometimes the accidental value of
status maps to a specific error text (which is not informative about the
actual error), but most of the times it will lead to "Unknown Op Common
Status".

F.

