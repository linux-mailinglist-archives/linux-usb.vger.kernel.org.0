Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87A80347A53
	for <lists+linux-usb@lfdr.de>; Wed, 24 Mar 2021 15:12:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236088AbhCXOLv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Mar 2021 10:11:51 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:48161 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236050AbhCXOLf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Mar 2021 10:11:35 -0400
Received: from rpi3.fritz.box ([46.90.46.54]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.113]) with ESMTPA (Nemesis) id
 1MJEAX-1l4Myq3ie3-00Kg59; Wed, 24 Mar 2021 15:11:28 +0100
From:   Fabian Vogt <fabian@ritter-vogt.de>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Fabian Vogt <fabian@ritter-vogt.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yuan-Hsin Chen <yhchen@faraday-tech.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 0/7] Fix the fotg210-udc driver
Date:   Wed, 24 Mar 2021 15:11:08 +0100
Message-Id: <20210324141115.9384-1-fabian@ritter-vogt.de>
X-Mailer: git-send-email 2.10.0
X-Provags-ID: V03:K1:vFNDpT6rli+pZ15ITdwil8UyfZDm+LS6CoHxwlEOQeTITofHV52
 a+itJcdKXK8rb704NLWvl/yln6Qho+z0wuj18yZ9V+QoAHuc/E/y7QUbiqwiWFBw6zIDSnH
 xTK/YxgygTtprL2lCJ10F0T9xbnV67BBimixjv89F4DGwagCOvmqp0U5FlnM5eVUg6lcWKr
 Xs7najAUF+5I49M5ZCdrA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cuqD7D73L1Y=:JtISCRQi+E4M5hijNXZ0YO
 aXihzxq/FYbZr6ZuNNwLcjUwE9dvuZ/L1SfYmA1DLI3fL7/TL4sOGfgCnPlQ8HfPJwz+5cAlY
 +xi47C79NAR1IbDAEWu4k/QGOuV6nunaTd0di8hpfXYnLqVslijarCz0ajGa4a8OTD16BBc+Q
 epBz0iPZFz5FaEC1KXmlvIPoi9xARbRDKPXsaSopg+lx66QQTzFOVO5/fmitoBBsRVxLMgS0z
 PfqA81TX84rtu/DCZRgWU+sdBnPHK53YLDQ/PQqbA6EKlDqWgFq/nSWlqf3lekcK+b0BwAmW4
 VuJzSkFLNQJO5VjMx0YQga7AdEBB+kkxnIL/jN/Kqq8mKwdivFzdoOZ8iAfev5m1p64Aul7oA
 Rl8PCi/0QIX5W1oMSjgO66Mb/Xgo38An1FG7Li1rg3JLQ5ahfyHoP1UXez7ruL4ie6tyh2dKQ
 BxjHSKWyyw==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Moin!

USB is the main way of communicating with the TI Nspire CX II calculators,
so supporting the controller in Linux is necessary to make the port
somewhat useful. While implementing support for the specific controller
model inside, I found and fixed various bugs in this driver. Most of them
are part of the original driver code already and are so severe, that I
seriously wonder whether anyone actually used this driver ever.

With this series applied and some CX II specific commits on top, the
driver works fine for both USB serial and ethernet here.

The CX II support patches build upon this series, to avoid bigger
reiterations I'll submit them once this series got some positive feedback.

Cheers,
Fabian

To: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yuan-Hsin Chen <yhchen@faraday-tech.com>
CC: linux-usb@vger.kernel.org

Fabian Vogt (7):
  fotg210-udc: Fix DMA on EP0 for length > max packet size
  fotg210-udc: Fix EP0 IN requests bigger than two packets
  fotg210-udc: Remove a dubious condition leading to fotg210_done
  fotg210-udc: Mask GRP2 interrupts we don't handle
  fotg210-udc: Call usb_gadget_udc_reset
  fotg210-udc: Don't DMA more than the buffer can take
  fotg210-udc: Complete OUT requests on short packets

 drivers/usb/gadget/udc/fotg210-udc.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

-- 
2.25.1

