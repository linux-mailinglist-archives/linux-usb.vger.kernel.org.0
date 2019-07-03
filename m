Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADAA95D0D7
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2019 15:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727171AbfGBNj7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jul 2019 09:39:59 -0400
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235]:50032 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726820AbfGBNj6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Jul 2019 09:39:58 -0400
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
        by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x62DbIPE025603;
        Tue, 2 Jul 2019 06:38:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=wtlWal8fhkFNqnaZyC4YXq2+4L/w306FULvapCRCynQ=;
 b=Hb7neCXOnj7plqrYZ99Sz9mYrKvxHpELAoEyVCJIODQMw5sahqj24XhI8mSUrSOT4MYo
 oUq+gY0M7quHuChouJgfhNX6FL4fpT1j1ThyLN3O+3qowihPedOy6CC0iVJaZXHlXDpA
 iYTzuszHTTrL+uO5lYwoG0FzyVCsR33SsiDIJutX9beu9ICa3BcJoJJmpGpl1RJa/9cX
 B2zc6TCczwUSqQpCM7sxAmX6sN4zOEdPaZKYO+hmOD45bnHJ0LrtpdUrLr0Lq9/n7Vuf
 2UvII58wzk1kw7BM6Tkgas6fxPw1Ku+1yIPxAx73l3xqfBV/nlFnYBBCJBrBLfnvbdvK Qg== 
Authentication-Results: cadence.com;
        spf=pass smtp.mailfrom=pawell@cadence.com
Received: from nam03-dm3-obe.outbound.protection.outlook.com (mail-dm3nam03lp2051.outbound.protection.outlook.com [104.47.41.51])
        by mx0a-0014ca01.pphosted.com with ESMTP id 2tg6v7rawj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Tue, 02 Jul 2019 06:38:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wtlWal8fhkFNqnaZyC4YXq2+4L/w306FULvapCRCynQ=;
 b=hILMW/KdqbFLvz90AuEbh/HDGXIgRyCcREJ0av/nudTCfA7Zbfrvo7C4uauY4Swq+uG2pZk//Vt/JaDcxtcquIrYLA8rDibhPx30VqeE7dkVZ7cjrkVPbrUu3UEeTPWjCu6U/iXAyJpSPy/A3pmBIMzm1iCsxcsfe4GhlmTmoLI=
Received: from CH2PR07CA0028.namprd07.prod.outlook.com (2603:10b6:610:20::41)
 by CO2PR07MB2631.namprd07.prod.outlook.com (2603:10b6:102:17::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2032.20; Tue, 2 Jul
 2019 13:38:25 +0000
Received: from CO1NAM05FT059.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::202) by CH2PR07CA0028.outlook.office365.com
 (2603:10b6:610:20::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2032.18 via Frontend
 Transport; Tue, 2 Jul 2019 13:38:25 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 CO1NAM05FT059.mail.protection.outlook.com (10.152.96.177) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.8 via Frontend Transport; Tue, 2 Jul 2019 13:38:24 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
        by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id x62DcKJv032652
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Tue, 2 Jul 2019 06:38:23 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Tue, 2 Jul 2019 15:38:19 +0200
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Tue, 2 Jul 2019 15:38:19 +0200
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
        by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x62DcJug032106;
        Tue, 2 Jul 2019 14:38:19 +0100
Received: (from pawell@localhost)
        by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x62DcGit032055;
        Tue, 2 Jul 2019 14:38:16 +0100
From:   Pawel Laszczak <pawell@cadence.com>
To:     <devicetree@vger.kernel.org>
CC:     <gregkh@linuxfoundation.org>, <felipe.balbi@linux.intel.com>,
        <linux-usb@vger.kernel.org>, <hdegoede@redhat.com>,
        <heikki.krogerus@linux.intel.com>, <robh+dt@kernel.org>,
        <rogerq@ti.com>, <linux-kernel@vger.kernel.org>,
        <jbergsagel@ti.com>, <nsekhar@ti.com>, <nm@ti.com>,
        <sureshp@cadence.com>, <peter.chen@nxp.com>, <jpawar@cadence.com>,
        <kurahul@cadence.com>, <aniljoy@cadence.com>,
        "Pawel Laszczak" <pawell@cadence.com>
Subject: [PATCH v8 0/6] Introduced new Cadence USBSS DRD Driver.
Date:   Tue, 2 Jul 2019 14:37:56 +0100
Message-ID: <1562074682-31579-1-git-send-email-pawell@cadence.com>
X-Mailer: git-send-email 1.7.11.2
MIME-Version: 1.0
Content-Type: text/plain
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28;IPV:CAL;SCL:-1;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(346002)(396003)(136003)(376002)(39860400002)(2980300002)(199004)(189003)(36092001)(8936002)(7416002)(966005)(486006)(476003)(2616005)(186003)(5660300002)(4326008)(26005)(126002)(51416003)(2906002)(54906003)(16586007)(76130400001)(2351001)(50226002)(336012)(70206006)(48376002)(107886003)(316002)(7636002)(47776003)(426003)(14444005)(6666004)(356004)(86362001)(87636003)(478600001)(305945005)(36756003)(26826003)(246002)(70586007)(6306002)(4720700003)(8676002)(42186006)(50466002)(6916009)(30864003);DIR:OUT;SFP:1101;SCL:1;SRVR:CO2PR07MB2631;H:sjmaillnx2.cadence.com;FPR:;SPF:SoftFail;LANG:en;PTR:corp.cadence.com;A:1;MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55046bb4-4010-4f68-80f2-08d6fef28e8c
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);SRVR:CO2PR07MB2631;
X-MS-TrafficTypeDiagnostic: CO2PR07MB2631:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <CO2PR07MB26314BAF3398DBAE1F57254BDDF80@CO2PR07MB2631.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 008663486A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: qAyO8WVz5vYRLusjpdn1pH8ypY6dpDZJin56KgWP01EhFhu0ADcjeXC8QP7zobQ/4CKsPlvoxrJdEvkLlch3QoIeD+VG3CLPerIfUGiKkAQMoGJlHk/NlKRkvv5K3TbBBpPMpQsGgNzEnKkCXr++X3B6+St1wg2wGt81EKwOa+mOGh/YXiDDbQ8EzJs4qKw5vNKtZSDAOMdDW0h04lW7GEbKjxCNRXbAElox1UkCj9HlTPT+1TYv1M6KQltT78rIMVnMIOF8dOQi6xTfJQmHl6DIpx/pPh5T3c/NHiCq80eZfUPWhzrk/ey9hvwdNoYMrpADaH83ig3f/5okVkzvyjAdvu9pmzsjPPRA6ccvRaFgvGsUD8aRrqzMyrfybalCoyz4i7ktnc0FJG5f3clYhSsEkoVzd9tuEcktuKJAWDA=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2019 13:38:24.2253
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55046bb4-4010-4f68-80f2-08d6fef28e8c
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9;Ip=[158.140.1.28];Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR07MB2631
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:spf.smktg.jp include:_spf.salesforce.com
 include:mktomail.com include:spf-0014ca01.pphosted.com
 include:spf.protection.outlook.com include:auth.msgapp.com
 include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-07-02_07:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907020149
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch introduce new Cadence USBSS DRD driver to linux kernel.

The Cadence USBSS DRD Controller is a highly configurable IP Core which
can be instantiated as Dual-Role Device (DRD), Peripheral Only and
Host Only (XHCI)configurations.

The current driver has been validated with FPGA burned. We have support
for PCIe bus, which is used on FPGA prototyping.

The host side of USBSS-DRD controller is compliance with XHCI
specification, so it works with standard XHCI Linux driver.

Change since v7:
- Updated dt-binding.
- Simplified debugfs file as suggested by Heikki Krogerus.
- Changed some dev_info to dev_dbg.
- Added support for additional PHY. Now driver can use both USB2 PHY
  and USB3 PHY.
- Fixed issue in algorithm checking the number of allocated on-chip buffers.
- Moved common code form drivers/usb/common/debug.c to
  drivers/usb/gadget/debug.c.
- Removed warning generated by sh4-linux-gcc compiler for trace.h file.
- L1 issue: moved resuming after setting DRDY. It should protect against 
  potential racing.
- LPM packet acknowledge has been disabled during controll transfer.
- Aded setting AXI Non-Secure mode in DMA_AXI_CTRL register. 

Change since v6:
- Fixed issue with L1 support. Controller has issue with hardware 
  resuming from L1 state. It was fixed in software. 
- Fixed issues related with Transfer Ring Size equal 2. 
- Fixed issue with removing cdns3.ko module. Issue appeared on the latest 
  version of kernel.
- Added separate interrupt resources for host, device and otg. It was 
  added mainly for compatibility with TI J721e platforms. 
- Added enabling ISO OUT just before arming endpoint. It's recommended by 
  controller specification.
- Added support for 0x0002450d controller version. This version allows to set 
  DMULT mode per endpoint. It also fixes WA1 issue.
- Added support for separate interrupt line for Device and OTG/DRD.
- Removed drd_update_mode from drd_init, 'desired_dr_mode' is not yet correctly
  set based on enabled drivers and dr_mode in DT.
- Added phy power on/off.
- Added setting dma and coherent mask to 32-bits, because controller can do
  only 32-bit access.
- Added Idle state for Type-C for platform TI J721e as suggested by Roger. 
- Improved the flow according with Figure 24 from Software OTG Control user
  guide as sugested by Roger.

Change since v5:
- Fixed controller issue with handling SETUP that has occurred on 0x0002450C
  controller version. In some case EP_STS_SETUP is reported but SETUP
  packet has not been copied yet to system memory. This bug caused that
  driver started handling the previous SETUP packet.
- Added handling ZLP for EP0.
- Removed unused cdns3_gadget_ep0_giveback function.
- Fixed issue with disabling endpoint. Added waiting for clearing EP_STS_DBUSY
  bit between disabling endpoint and calling EP_CMD_EPRST command.
  EP_CMD_EPRST command can be called only when DMA is stopped.
- Fixed issue: EP_CFG_TDL_CHK is currently supported only for OUT direction,
  It was enabled for both IN/OUT direction.
- Improved resetting of interrupt in cdns3_device_irq_handler.
- Fixed issue with ISOC IN transfer in cdns3_ep_run_transfer function. In some
  cases driver set incorrect Cycle Bit in TRBs.
- Fixed issue in function cdns3_ep_onchip_buffer_reserve. Driver assigned 
  incorrect value to priv_dev->out_mem_is_allocated field.

Change since v5:
- fixed compilation error.

Changes since v4:
- fixed issue: with choosing incorrect dr_mode in cdns3_core_init_role.
- speed up DRD timings by adding an appropriate entry to OTGSIMULATE
  register in cdns3_drd_init function.
- added detecting transition to DEV_IDLE/H_IDLE state instead using
  usleep_range in cdns3_drd_switch_gadget and cdns3_drd_switch_host functions.
- fixed issue with setting incorrect burst and mult field during endpoint
  configuration. 
- fixed issue in WA1 algorithm. The previous one could not work correct with
  slow CPU or in case the access to AXI bus would be blocked for some time.
- fixed issue with compilation driver occurred when driver was configured
  as build in. This fix required to move cdns3_handshake function from
  gadget.c to core.c file.
- added missing pci_disable_device in cdns3-pci-wrap.c file.
- fixed issue with pm_runtime_get_sync in cdns3_role_switch function.
- fixed incorrect condition in cdns3_decode_usb_irq function.
- removed cdns3_data_flush function - is no longer used.
- fixed issue in cdns3_descmissing_packet function - fixed incorrect condition
- added missed callback informing upper layer about reset event.
- added resetting endpoint in cdns3_gadget_ep_disable function.
- fixed issue: added statement removing request from descmiss_req_list in
  cdns3_gadget_ep_disable function.
- fixed issue in cdns3_ep_onchip_buffer_reserve.
- fixed issue with incorrect calculation the number of required on-chip buffer 
  for OUT endpoints cdns3_ep_onchip_buffer_reserve.
- fixed issue in __cdns3_gadget_init function: pm_runtime_get_sync was in
  incorrect place in.
- removed some typos and improved comments as suggested by reviewers.
- made some other minor changes as suggested by revivers.

Changes since v3:
- updated dt-binding as suggested by Rob Herring
- updated patch 002, 003 and 004 according with patch:
  https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git/commit/
  ?h=next&id=7790b3556fccc555ae422f1576e97bf34c8ab8b6 posted by Felipe Balbi.
- fixed issues related to isochronous transfers.
- improved algorithm calculating number of on-chip buffers required
  by endpoints.
- fixed incorrect macro EP_CFG_MULT in gadget.h file.
- fixed potential issue with incorrect order of instruction - added wmb().
- made some minor changes suggested by reviewers.

*Changes since v2:
- made some text correction in Kconfig file as suggested by Randy Dunlap.
- simplified Makefile as suggested by Peter Chan.
- removed phy-names from dt-binding as suggested Rob Herring.
- changed cdns3-usb.txt to cdns3-usb3.txt as suggested by Rob Herring.
- added checking error code in some function in drd.c file 
  as suggested by Peter Chan.
- added reg-names to dt-binding documentation as suggested by Chunfeng Yun.
- replaced platform_get_resource with platform_get_resource_byname.
- made other changes suggested by Chunfeng Yun.
- fixed bug in cdns3_get_id. Now function return id instead 1.
- added trace_cdns3_log trace event.
- simplify cdns3_disable_write function.
- create separate patch for work around related with blocking endpoint 
  issue.
- Fixed issue related with stale data address in TRB. 
  Issue: At some situations, the controller may get stale data address
  in TRB at below sequences:
  1. Controller read TRB includes data address.
  2. Software updates TRBs includes data address and Cycle bit.
  3. Controller read TRB which includes Cycle bit.
  4. DMA run with stale data address.
- Fixed issue without transfer. In some cases not all interrupts
  disabled in Hard IRQ was enabled in Soft Irq.
- Modified LFPS minimal U1 Exit time for controller revision 0x00024505.
- Fixed issue - in some case selected endpoint was unexpectedly changed.
- Fixed issue - after clearing halted endpoint transfer was not started.
- Fixed issue - in some case driver send ACK instead STALL in status phase.
- Fixed issues related to dequeue request.
- Fixed incorrect operator in cdns3_ep_run_transfer function.

Changes since v1:
 - Removed not implemented Suspend/Resume functions.
 - Fixed some issues in debugging related functions.
 - Added trace_cdns3_request_handled marker.
 - Added support for Isochronous transfer. 
 - Added some additional descriptions.
 - Fixed compilation error in cdns3_gadget_ep_disable.
 - Added detection of device controller version at runtime.
 - Upgraded dt-binding documentation.
 - Deleted ENOSYS from phy initialization section. It should be also removed
   from generic PHY driver.
 - added ep0_stage flag used during enumeration process.
 - Fixed issue with TEST MODE.
 - Added one common function for finish control transfer.
 - Separated some decoding function from dwc3 driver to common library file,
   and removed equivalents function from debug.h file as suggested  by Felipe.
 - replaced function name cdns3_gadget_unconfig with cdns3_hw_reset_eps_config.
 - Improved algorithm fixing hardware issue related to blocking endpoints.
   This issue is related to on-chip shared FIFO buffers for OUT packets. 
   Problem was reported by Peter Chan.
 - Changed organization of endpoint array in cdns3_device object.  
      - added ep0 to common eps array
      - removed cdns3_free_trb_pool and cdns3_ep_addr_to_bit_pos macros.
      - removed ep0_trb_dma, ep0_trb fields from cdns3_device.
 - Removed ep0_request and ep_nums fields from cdns3_device.
 - Other minor changes according with Felipe suggestion.

---

Pawel Laszczak (6):
  dt-bindings: add binding for USBSS-DRD controller.
  usb:gadget Separated decoding functions from dwc3 driver.
  usb:gadget Patch simplify usb_decode_set_clear_feature function.
  usb:gadget Simplify usb_decode_get_set_descriptor function.
  usb:cdns3 Add Cadence USB3 DRD Driver
  usb:cdns3 Fix for stuck packets in on-chip OUT buffer.

 .../devicetree/bindings/usb/cdns-usb3.txt     |   45 +
 drivers/usb/Kconfig                           |    2 +
 drivers/usb/Makefile                          |    2 +
 drivers/usb/cdns3/Kconfig                     |   44 +
 drivers/usb/cdns3/Makefile                    |   14 +
 drivers/usb/cdns3/cdns3-pci-wrap.c            |  157 +
 drivers/usb/cdns3/core.c                      |  543 ++++
 drivers/usb/cdns3/core.h                      |  121 +
 drivers/usb/cdns3/debug.h                     |  173 ++
 drivers/usb/cdns3/debugfs.c                   |  153 +
 drivers/usb/cdns3/drd.c                       |  379 +++
 drivers/usb/cdns3/drd.h                       |  166 ++
 drivers/usb/cdns3/ep0.c                       |  920 ++++++
 drivers/usb/cdns3/gadget-export.h             |   28 +
 drivers/usb/cdns3/gadget.c                    | 2645 +++++++++++++++++
 drivers/usb/cdns3/gadget.h                    | 1334 +++++++++
 drivers/usb/cdns3/host-export.h               |   28 +
 drivers/usb/cdns3/host.c                      |   76 +
 drivers/usb/cdns3/trace.c                     |   23 +
 drivers/usb/cdns3/trace.h                     |  447 +++
 drivers/usb/dwc3/debug.h                      |  252 --
 drivers/usb/dwc3/trace.h                      |    2 +-
 drivers/usb/gadget/Makefile                   |    1 +
 drivers/usb/gadget/debug.c                    |  268 ++
 include/linux/usb/gadget.h                    |   26 +
 25 files changed, 7596 insertions(+), 253 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/cdns-usb3.txt
 create mode 100644 drivers/usb/cdns3/Kconfig
 create mode 100644 drivers/usb/cdns3/Makefile
 create mode 100644 drivers/usb/cdns3/cdns3-pci-wrap.c
 create mode 100644 drivers/usb/cdns3/core.c
 create mode 100644 drivers/usb/cdns3/core.h
 create mode 100644 drivers/usb/cdns3/debug.h
 create mode 100644 drivers/usb/cdns3/debugfs.c
 create mode 100644 drivers/usb/cdns3/drd.c
 create mode 100644 drivers/usb/cdns3/drd.h
 create mode 100644 drivers/usb/cdns3/ep0.c
 create mode 100644 drivers/usb/cdns3/gadget-export.h
 create mode 100644 drivers/usb/cdns3/gadget.c
 create mode 100644 drivers/usb/cdns3/gadget.h
 create mode 100644 drivers/usb/cdns3/host-export.h
 create mode 100644 drivers/usb/cdns3/host.c
 create mode 100644 drivers/usb/cdns3/trace.c
 create mode 100644 drivers/usb/cdns3/trace.h
 create mode 100644 drivers/usb/gadget/debug.c

-- 
2.17.1

