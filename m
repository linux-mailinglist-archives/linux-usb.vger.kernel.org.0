Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20AE270000
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jul 2019 14:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728972AbfGVMqX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Jul 2019 08:46:23 -0400
Received: from mout.gmx.net ([212.227.17.22]:41591 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728922AbfGVMqX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Jul 2019 08:46:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1563799569;
        bh=mjZELBNuReeXMRnBRN71qTsJjVA/WiYun9fQ7TjMHkM=;
        h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
        b=jnmpTgjKO78hJw8XSAnr7Svv1WV5G7BpEPrcV3lU9BT9ZNYnwsA+cYYqXMm1yvPz4
         +bLyIDn3t6XRslDshIqjuvCkl4siVDESIUza8ORj/Ry0vNiumy5o8UdlYr9cB1B6Vc
         vX3y7V8MatCfJdBQDL68kk965G6M7oAEJkEG3Nc8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.0.0.132] ([213.147.190.41]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7QxB-1iTrMC1I7B-017lsi; Mon, 22
 Jul 2019 14:46:09 +0200
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
From:   Bernhard Gebetsberger <bernhard.gebetsberger@gmx.at>
Subject: Regression xhci_hcd: WARN Set TR Deq Ptr cmd failed due to incorrect
 slot or ep state
Message-ID: <3426f724-3078-cdda-e485-5966e2126b89@gmx.at>
Date:   Mon, 22 Jul 2019 14:46:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:SFgHpM6MgaWtUbIiac1aG+l4NUYRQ1rj7YbYkIHy2T2q7SJ9eKg
 8rLV4STwALS8yHW/LqNZCR95JNvzFMpneJ8eNoFNXZgUZ4zWo00PuO2JILttoTK7OR7IFMh
 A7yNziMjfaBiWPhaEwGDRILCq//zJkvcqotpaTzjbBU7Y0cgNoVfrsAh23/LFH42RQC5u+t
 o2MnWiKUWITOdZAxUtmIA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wd/CMi5bVBk=:gwGAr+c/8LBwrSg6aR53Mj
 5Mx5gxdZfEFJGfgnXOrW+2LRK0XUsAezEqg2fNjw4dP38PXwn8WbbqdiyXQ3IkeYTO7kk7PuT
 aidQQwz5W1Apa35UIaGNWHeSBwIuXoqXR5YhIroAQXjrYIjS2dBhAIA4xNWtYfhasJriNsdVF
 TgrUPF+B5jOF4oh4icJ/qJJmaZ8uyMulAcaKU4zJHNfGdTWi8GNkOs3RU/js0YtuSJm/KJT0y
 VmSKnvomtwXDU4u1Fow/UHYygf/3YLtf+3tNPrg/0ikEoMIR/U2/nX/2p7QiuHKu0/+9cStwH
 PmAQ1Uf9y5pBMeeT4Z0f4+u/0tSpF4RoajPVvBa5oaFNUlxBf6p7+700ZAcIJEwzgkZjrR2yx
 xtKAWh02iZkMsdM8IbRHMkGcebTnR9LOU9QuWJytIaAcUvTaKF0jVZ/NsezgfngFF/uTTLVlE
 WoifnOVyJAg2CBsoZSlxwV9BFKmJmEO7KxX6diKS7rm2eD/yoA7D9tkP/gXbThyFXCVZVJ9rh
 RYwUGqDD2nlf/+Zi6zAGMtnLvdwxBs7X1PMFlPSy4GKwxW3MQcDv6owqu9Mfhrn7LiYQ43L1j
 X7alj+D/zirl5HQpPZg4de2Ky4/XUqoT35QWfBx8WkLM7JZDxRQacHOffvyVvCWHeelHykq5Z
 /a5baHYpfFS3L6iREGY4sVmWucJMMS53VyZIFkgUcH1DOblLPrYoombkLQWT7yxwgvYowZHke
 o60rb4sVxJ3vvhFbbnRS9AiGHa/pvLKg40VCIyhpjKOBs2gxv1riG4pF979tQmQqOQdaOqBE3
 zm0JK/byHK6ClMQ1wi2g10d4DGX6fXgare4+UH+k2Jz/RuIggdzxlb+G4JLUjM3vz2WbOJ/hG
 ECKsO1+/TkOR4AZzCOa2+0Remcs7MWZx47SdEoFGqpqFPRiUvpb45TdY6iOGQ719mFwe/Y5wO
 x0Ti6FoFjfu28s2oIEYWjiJStF4/VrkohkriKzCrCnL2QDkHK7RknaCjYLDMOTezu+N0pIGsJ
 5y9nD7LhBXAgEA1CG9gjGIit/NxZUWkif+US8+DTiUI0SHz158aw2QdFY6kfmYXDRAhqI7PGi
 7gWAoilrG9o9g42zuzmE5t+HPycZFAktVK1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mathias,

around 1.5 weeks ago I've sent the dmesg log and xhci_hcd tracing file to you. Is there anything else that needs to be provided? How should we precede otherwise?

The problem occurs since kernel version 4.20 and it looks like more and more people are affected by this, most of them blame their wifi driver for it. Maybe it would be the best to just revert the patch that is causing the problem?

The regression is caused by the changes in process_bulk_intr_td(), it's part of this commit:

commit f8f80be501aa2f10669585c3e328fad079d8cb3a
Author: Mathias Nyman <mathias.nyman@linux.intel.com <mailto:mathias.nyman@linux.intel.com>>
Date:   Thu Sep 20 19:13:37 2018 +0300

    xhci: Use soft retry to recover faster from transaction errors

In case you missed the mail with the log files, I've uploaded them on transfer.sh: https://transfer.sh/KDEeE/dmesg and https://transfer.sh/14Imam/trace

- Bernhard


