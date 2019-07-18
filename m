Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73F596D3DB
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jul 2019 20:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390991AbfGRS0a convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 18 Jul 2019 14:26:30 -0400
Received: from mga14.intel.com ([192.55.52.115]:42322 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727928AbfGRS03 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 18 Jul 2019 14:26:29 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Jul 2019 11:26:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,279,1559545200"; 
   d="scan'208";a="367015508"
Received: from orsmsx109.amr.corp.intel.com ([10.22.240.7])
  by fmsmga005.fm.intel.com with ESMTP; 18 Jul 2019 11:26:29 -0700
Received: from orsmsx154.amr.corp.intel.com (10.22.226.12) by
 ORSMSX109.amr.corp.intel.com (10.22.240.7) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 18 Jul 2019 11:26:28 -0700
Received: from orsmsx102.amr.corp.intel.com ([169.254.3.142]) by
 ORSMSX154.amr.corp.intel.com ([169.254.11.96]) with mapi id 14.03.0439.000;
 Thu, 18 Jul 2019 11:26:28 -0700
From:   "Yang, Fei" <fei.yang@intel.com>
To:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        "john.stultz@linaro.org" <john.stultz@linaro.org>,
        "andrzej.p@collabora.com" <andrzej.p@collabora.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH V2] usb: dwc3: gadget: trb_dequeue is not updated
 properly
Thread-Topic: [PATCH V2] usb: dwc3: gadget: trb_dequeue is not updated
 properly
Thread-Index: AQHVPUaDMYdk5Cgjz0WPgMvoOhlVmqbQnM5Q
Date:   Thu, 18 Jul 2019 18:26:27 +0000
Message-ID: <02E7334B1630744CBDC55DA8586225837F8DD883@ORSMSX102.amr.corp.intel.com>
References: <1563396788-126034-1-git-send-email-fei.yang@intel.com>
 <87o91riux9.fsf@linux.intel.com>
In-Reply-To: <87o91riux9.fsf@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMDBiZWE2MjMtMDliNS00NjZiLThhNDgtNWRlNmRjZWQ0ZjZkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoieGJPbTY0RWpFbmxMdkNvSEQ5cUpPZk9hdktFVTVENW5EelJPZWpscWdhbDE3S3Y0MnRTOFBqY3Npb3M3SzRVaiJ9
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.22.254.139]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> Can only be true for last TRB
>
| 	if (event->status & DEPEVT_STATUS_IOC)
| 		return 1;

This is the problem. The whole USB request gets only one interrupt when the last TRB completes, so dwc3_gadget_ep_reclaim_trb_sg()
gets called with event->status = 0x6 which has DEPEVT_STATUS_IOC bit set. Thus dwc3_gadget_ep_reclaim_completed_trb() returns 1
for the first TRB and the for-loop ends without having a chance to iterate through the sg list.

> If we have a short packet, then we may fall here. Is that the case?

No need for a short packet to make it fail. In my case below, a 16384 byte request got slipt into 4 TRBs of 4096 bytes. All TRBs were
completed normally, but the for-loop in dwc3_gadget_ep_reclaim_trb_sg() was terminated right after handling the first TRB. After that
the trb_dequeue is messed up.

buffer_addr,size,type,ioc,isp_imi,csp,chn,lst,hwo
0000000077849000, 4096,normal,0,0,1,1,0,0
000000007784a000, 4096,normal,0,0,1,1,0,0
000000007784b000, 4096,normal,0,0,1,1,0,0
000000007784c000, 4096,normal,1,0,1,0,0,0
000000007784d000, 512,normal,1,0,1,0,0,0

My first version of the patch was trying to address the issue in dwc3_gadget_ep_reclaim_completed_trb(), but then I thought it's a bad
idea to touch this function because that is also called from non scatter_gather list case, and I was not sure if returning 1 for the linear
case is correct or not.


-Fei
