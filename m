Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2B0B104CB3
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2019 08:38:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbfKUHiK convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 21 Nov 2019 02:38:10 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:41821 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbfKUHiK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Nov 2019 02:38:10 -0500
Received: from mail-pg1-f199.google.com ([209.85.215.199])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1iXh2W-0007Kf-Jx
        for linux-usb@vger.kernel.org; Thu, 21 Nov 2019 07:38:08 +0000
Received: by mail-pg1-f199.google.com with SMTP id m13so1500634pgk.12
        for <linux-usb@vger.kernel.org>; Wed, 20 Nov 2019 23:38:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:content-transfer-encoding:mime-version
         :subject:message-id:date:cc:to;
        bh=sGg/RhEeP2tYKRSL1o4nLlGOLM/XVFLJwEms17My2LA=;
        b=ctNSO7Dg8E6t8Lh6JG3/UUL1pmehZA9aQtyQnM6rKnR1z27wt8Wg9S618NKox4kYcU
         sRP+d7Z4dai7+KWwedkzfnvyuP6b9rbknMXiFwpzw83gnsqkvK1vcN1EtenvA7oOovqy
         MAhv2MvlQq2vVBcy1JGWwEtizzRSoYu9zqOUfL4UeLDppXkVQzrMO7aGPvoQkWTzulpp
         5+O9bOaNukLvLR+Y1Ynp7H8eBWnekSPk9eFCkGS9stqnYi7Tu0eEM7tD2oazudNz3jx+
         LLvHO4BJsU9eY+J9uiVcUjkIIPPLQSMV78uDJKADSLpi7JOPsAz/mMFuo4K7LaeY4eTY
         719g==
X-Gm-Message-State: APjAAAXylwpSd+S3GMMU5TCASG+2NR17gWHcKO4Ka+5T38jouXwBDlGa
        94F3n2XiBW5/rWz6n6/0Lu76VkgGqlFW4KQ2usvPKVjN/mgtXWn95cEHG7tyl8KTCQZeA2MUGOn
        pCgJB7EQpNJNUcW7Bou0G9o0CLUMmx8TnstWjQw==
X-Received: by 2002:a63:4721:: with SMTP id u33mr8011463pga.159.1574321887043;
        Wed, 20 Nov 2019 23:38:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqxqm1VxAGlRh/393mBikNuVp+d83oH5oQQK6qTwBwoelDtm4Upja0jEE4xdvZkRjji+Hvxu+w==
X-Received: by 2002:a63:4721:: with SMTP id u33mr8011434pga.159.1574321886627;
        Wed, 20 Nov 2019 23:38:06 -0800 (PST)
Received: from 2001-b011-380f-3c42-51f2-dc73-8a12-1a6d.dynamic-ip6.hinet.net (2001-b011-380f-3c42-51f2-dc73-8a12-1a6d.dynamic-ip6.hinet.net. [2001:b011:380f:3c42:51f2:dc73:8a12:1a6d])
        by smtp.gmail.com with ESMTPSA id y26sm2116554pfo.76.2019.11.20.23.38.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Nov 2019 23:38:06 -0800 (PST)
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: 8BIT
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2
 comp_code 13
Message-Id: <F9C894A9-D1D8-455E-B5F6-C5EA08A80C79@canonical.com>
Date:   Thu, 21 Nov 2019 15:38:04 +0800
Cc:     USB list <linux-usb@vger.kernel.org>
To:     Mathias Nyman <mathias.nyman@intel.com>
X-Mailer: Apple Mail (2.3601.0.10)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Currently there are two quirks for Dell TB16 to workaround an issue:
"xhci: Bad Ethernet performance plugged in ASM1042A host", and
"r8152: disable RX aggregation on Dell TB16 dock".

However, the issue wasn't analyzed and root caused. I'd like to understand what's really going on here.
Reverting those two patches, and as soon as doing TX/RX over the ethernet on TB16, xhci_hcd errors out:

[   69.803804] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
[   69.803807] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1010 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
[   69.803900] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
[   69.803901] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1020 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
[   69.803998] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
[   69.803999] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1030 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
[   69.804096] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
[   69.804099] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1040 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
[   69.955830] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
[   69.955847] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1050 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
[   69.956704] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
[   69.956718] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1060 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
[   69.963802] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
[   69.963819] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1070 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0
[   70.112302] xhci_hcd 0000:3f:00.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 2 comp_code 13
[   70.112321] xhci_hcd 0000:3f:00.0: Looking for event-dma 000000047c4b1080 trb-start 000000047c4b0fe0 trb-end 000000047c4b0fe0 seg-start 000000047c4b0000 seg-end 000000047c4b0ff0

So, under what circumstances the DMA pointer can be out of the TD?

Kai-Heng
