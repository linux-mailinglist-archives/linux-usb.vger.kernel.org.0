Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D5DD4004C9
	for <lists+linux-usb@lfdr.de>; Fri,  3 Sep 2021 20:23:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235856AbhICSYg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Sep 2021 14:24:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235777AbhICSYd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Sep 2021 14:24:33 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 019E5C061757
        for <linux-usb@vger.kernel.org>; Fri,  3 Sep 2021 11:23:33 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id q21so191839ljj.6
        for <linux-usb@vger.kernel.org>; Fri, 03 Sep 2021 11:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=dXgvf4SdMRE8wkn2RKTkx51vAgt2E2YJeyJvHB+YTlA=;
        b=lXSPgDMrgWmO9aN3Yx5mOcQadKdtvqgl9DSES6EAf0YVNcMAvsQFaPkiwhDItNy0Hs
         c0JmEMiDGLItaBTC4NLhbiPmgQsg0jxrFppkW3OKgyAT3Y4TiOKch+ibpQPHNEGl9DpT
         YKiAwHQsYY2s7bOY9MFQKBXX4qY39QbqnVycVY0CCWpoPT673CFv0ltnzVy++WF1uNcY
         KeUiu4JHJzWPg/siZUQvevffCqN4Z6x+V56MvAjgi/lxE54kZ/0pYd8uY2OqMIm8AUmZ
         z2YdVixP/7TSp7KP/OJwOYGKtetfz5ceKx0l+cy/prewPj5rO4jQoIlb7/Q7MBX5Am9I
         TzIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=dXgvf4SdMRE8wkn2RKTkx51vAgt2E2YJeyJvHB+YTlA=;
        b=ERybN2an7HqIpzoeoOej/LpkG5AFUDhFmar+7PLjspA/EjDBWJELMawR3eC2Y9w0Np
         HAsLYdGOx0jSgjKMgDjtIThqbzBvj4WU+HeXSEUHo9Grm+n81lA/jqYH7cI8N7bHKuoR
         X4fMajl/QehYRC9AXepcRwNlgPl2BUicOJgzZa0JPLkHPVsEy0y6AciWWBASZmwIfkUw
         +r5CfuEqEsA/Pbxduq1zL8+1U/HIjm0y3kVrwI6EbNAz39/NWaHeTmXc/d5njRuEMhFe
         JaHs/5kmZKi97vDSTXizXnbB8GN3vmSoUGPm4jloyhxenU7O7V9Zgnu15HjoFCmB+fme
         CnxA==
X-Gm-Message-State: AOAM532LYvdIoisWi+9T6lGNQ+4Z8mA5zYF7/NVg8VSUsExxu+5hx1WI
        tXWNPQdrjv6Qzmrhz+l/dSyDUo/3h8X+yfDcMkUDAtSIZkY=
X-Google-Smtp-Source: ABdhPJw5U+fW9wHFHAfaQnsjTKMANTw8nvQJ9ek6EIKOmRKgiWg9NJYJp2+nQud8MgAv1yuQMoyu8hJEUvuNVz6uPHU=
X-Received: by 2002:a05:651c:311:: with SMTP id a17mr243097ljp.450.1630693411105;
 Fri, 03 Sep 2021 11:23:31 -0700 (PDT)
MIME-Version: 1.0
From:   Shantur Rathore <shantur.rathore@gmail.com>
Date:   Fri, 3 Sep 2021 19:23:20 +0100
Message-ID: <CAHc5_t3R8uiYaKe__Wc+1FHvyH4=yS7OVBcdOUsXKet44LK8zA@mail.gmail.com>
Subject: [BUG REPORT] usb: dwc3: Bug - last endpoint is wrong direction
To:     felipe.balbi@linux.intel.com
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I am running dwc3 in peripheral mode for emulating a composite device.
Details are

Kernel version - Latest mainline master and 5.14
SoC - Rockchip RK3399
SBC - RockPro64

Bug info :
In RK3399 as per documentation (
https://usermanual.wiki/Document/RockchipDeveloperGuidelinux44USB.31610806/view
), there are 7 Input Endpoints and 6 Output endpoints, in total 13
endpoints.

Currently in dwc3/gadget.c driver, it uses the number of endpoints
available and starts setting them up with even endpoints as output
endpoints and odd numbered as even endpoints. This leads to 7 Output
endpoints and 6 input endpoints for RK3399.

If you try to create a composite gadget which uses all the input
endpoints, one can see the issue. You just need to create functions to
use up the last input ep and it would fail to create. No need to
connect it to the host.
This was confirmed when running a rockchip-linux bsp image.

[root@rockpro rock]# ls /sys/kernel/debug/usb/fe800000.usb/
ep0in  ep0out  ep1in  ep1out  ep2in  ep2out  ep3in  ep3out  ep4in
ep4out  ep5in  ep5out  ep6in  link_state  lsp_dump  mode  regdump
testmode

Currently in linux mainline it is

[root@rockpro rock]# ls /sys/kernel/debug/usb/fe800000.usb/
ep0in  ep0out  ep1in  ep1out  ep2in  ep2out  ep3in  ep3out  ep4in
ep4out  ep5in  ep5out  ep6out  link_state  lsp_dump  mode  regdump
testmode

ep6 being out instead of in as per the hardware spec.

Upon investigation of rockchip bsp kernel,

https://github.com/rockchip-linux/kernel/blob/develop-4.4/drivers/usb/dwc3/gadget.c#L2023

The issue was clear, currently, dwc3/gadget driver doesn't take
DWC3_NUM_IN_EPS into consideration while enumerating them.

The patch below fixes the issue and ep6 is correctly enumerated as input.

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 01866dcb953b..279c9a97cb8c 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -555,6 +555,7 @@ static void dwc3_core_num_eps(struct dwc3 *dwc)
  struct dwc3_hwparams *parms = &dwc->hwparams;

  dwc->num_eps = DWC3_NUM_EPS(parms);
+ dwc->num_in_eps = DWC3_NUM_IN_EPS(parms);
 }

 static void dwc3_cache_hwparams(struct dwc3 *dwc)
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 5612bfdf37da..89a0998c618c 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1227,6 +1227,7 @@ struct dwc3 {
  u8 speed;

  u8 num_eps;
+ u8 num_in_eps;

  struct dwc3_hwparams hwparams;
  struct debugfs_regset32 *regset;
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 804b50548163..d9d19dc0a29f 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -693,9 +693,11 @@ void dwc3_gadget_clear_tx_fifos(struct dwc3 *dwc)

  dwc->last_fifo_depth = fifo_depth;
  /* Clear existing TXFIFO for all IN eps except ep0 */
- for (num = 3; num < min_t(int, dwc->num_eps, DWC3_ENDPOINTS_NUM);
-      num += 2) {
+ for (num = 3; num < DWC3_ENDPOINTS_NUM; num += 2) {
  dep = dwc->eps[num];
+
+ if(!dep)
+ continue;
  /* Don't change TXFRAMNUM on usb31 version */
  size = DWC3_IP_IS(DWC3) ? 0 :
  dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(num >> 1)) &
@@ -2257,7 +2259,7 @@ static void dwc3_stop_active_transfers(struct dwc3 *dwc)
 {
  u32 epnum;

- for (epnum = 2; epnum < dwc->num_eps; epnum++) {
+ for (epnum = 2; epnum < DWC3_ENDPOINTS_NUM; epnum++) {
  struct dwc3_ep *dep;

  dep = dwc->eps[epnum];
@@ -2960,10 +2962,9 @@ static int dwc3_gadget_init_out_endpoint(struct
dwc3_ep *dep)
  return dwc3_alloc_trb_pool(dep);
 }

-static int dwc3_gadget_init_endpoint(struct dwc3 *dwc, u8 epnum)
+static int dwc3_gadget_init_endpoint(struct dwc3 *dwc, u8 epnum, bool
direction)
 {
  struct dwc3_ep *dep;
- bool direction = epnum & 1;
  int ret;
  u8 num = epnum >> 1;

@@ -3011,21 +3012,30 @@ static int dwc3_gadget_init_endpoint(struct
dwc3 *dwc, u8 epnum)
  return 0;
 }

-static int dwc3_gadget_init_endpoints(struct dwc3 *dwc, u8 total)
+static int dwc3_gadget_init_endpoints(struct dwc3 *dwc, u8 total, u8
num_in_eps)
 {
- u8 epnum;
+ u8 num;
+ int ret;

  INIT_LIST_HEAD(&dwc->gadget->ep_list);

- for (epnum = 0; epnum < total; epnum++) {
- int ret;
+ /* init input endpoints as reported by hw */
+        for (num = 0; num < num_in_eps; num++) {

- ret = dwc3_gadget_init_endpoint(dwc, epnum);
- if (ret)
- return ret;
- }
+                ret = dwc3_gadget_init_endpoint(dwc, (num << 1) + 1, 1);
+                if (ret)
+                        return ret;
+        }

- return 0;
+        /* init rest endpoints as output endpoints */
+        for (num = 0; num < total - num_in_eps; num++) {
+
+                ret = dwc3_gadget_init_endpoint(dwc, num << 1, 0);
+                if (ret)
+                        return ret;
+        }
+
+ return ret;
 }

 static void dwc3_gadget_free_endpoints(struct dwc3 *dwc)
@@ -4282,7 +4292,7 @@ int dwc3_gadget_init(struct dwc3 *dwc)
  * sure we're starting from a well known location.
  */

- ret = dwc3_gadget_init_endpoints(dwc, dwc->num_eps);
+ ret = dwc3_gadget_init_endpoints(dwc, dwc->num_eps, dwc->num_in_eps);
  if (ret)
  goto err4;


This fixes the ep6 direction and now I can create a simple composite
gadget that uses all in endpoints but the last function ( the one that
uses ep6in ) just doesn't work.

Sample script to bring up this issue

mkdir /sys/kernel/config/usb_gadget/g1
# cd to its configfs node
cd /sys/kernel/config/usb_gadget/g1
# configure it (vid/pid can be anything if USB Class is used for driver compat)
echo 0xabcd > idVendor
echo 0x1234 > idProduct
# configure its serial/mfg/product
mkdir strings/0x409
echo myserial > strings/0x409/serialnumber
echo mymfg > strings/0x409/manufacturer
echo myproduct > strings/0x409/product
# create configs
mkdir configs/c.1
#mkdir configs/c.2
#mkdir configs/c.3
# configure them with attributes if needed
echo 120 > configs/c.1/MaxPower
#echo 120 > configs/c.2/MaxPower
#echo 120 > configs/c.2/MaxPower
# ensure function is loaded
#modprobe usb_f_mass_storage

function create_msd {
  dd bs=1M count=16 if=/dev/zero of=/tmp/d$1.img # 16MB
  mkdir functions/mass_storage.$1
  # mkdir functions/mass_storage.$1/lun.0
  echo /tmp/d$1.img > functions/mass_storage.$1/lun.0/file
  ln -s functions/mass_storage.$1 configs/c.1
}

function create_ncm {
  mkdir functions/ncm.usb$1
  ln -s functions/ncm.usb$1 configs/c.1
}

create_msd 0
create_msd 1
create_msd 2
create_msd 3
create_ncm 0 # NCM uses 2 input ep's
#create_msd 4
#create_msd 5

# enable gadget by binding it to a UDC from /sys/class/udc
ls /sys/class/udc/ > UDC

Any pointers on what I should be looking for and might be missing.

Kind regards,
Shantur
