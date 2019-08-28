Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B75C9A07F0
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2019 18:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726658AbfH1Q7D convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 28 Aug 2019 12:59:03 -0400
Received: from mga12.intel.com ([192.55.52.136]:13247 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726504AbfH1Q7D (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Aug 2019 12:59:03 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Aug 2019 09:58:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,441,1559545200"; 
   d="scan'208";a="185686955"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
  by orsmga006.jf.intel.com with ESMTP; 28 Aug 2019 09:58:55 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 28 Aug 2019 09:58:53 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 28 Aug 2019 09:58:53 -0700
Received: from bgsmsx101.gar.corp.intel.com (10.223.4.170) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 28 Aug 2019 09:58:53 -0700
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.178]) by
 BGSMSX101.gar.corp.intel.com ([169.254.1.124]) with mapi id 14.03.0439.000;
 Wed, 28 Aug 2019 22:28:50 +0530
From:   "Gopal, Saranya" <saranya.gopal@intel.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "Nyman, Mathias" <mathias.nyman@intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Balaji, M" <m.balaji@intel.com>
Subject: RE: [PATCH v2 2/2] usb: roles: intel: Enable static DRD mode for
 role switch
Thread-Topic: [PATCH v2 2/2] usb: roles: intel: Enable static DRD mode for
 role switch
Thread-Index: AQHVXbSR0HQXw64hHk63oUWo/lG3NacQXWIAgABqegA=
Date:   Wed, 28 Aug 2019 16:58:50 +0000
Message-ID: <C672AA6DAAC36042A98BAD0B0B25BDA94CCB4E02@BGSMSX104.gar.corp.intel.com>
References: <1567004932-16967-1-git-send-email-saranya.gopal@intel.com>
 <1567004932-16967-3-git-send-email-saranya.gopal@intel.com>
 <20190828160606.GC5486@kuha.fi.intel.com>
In-Reply-To: <20190828160606.GC5486@kuha.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNThmNDQ3NzQtOTIxMi00MmQxLTkyNWMtYTVmOGExZGUyZWI2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiRXBBeHE5OEw3Mno5SzYzd3BlcXc3WlNjQ2VTWSt3T0RNcTJxS0RvcklxSDArK09MXC9PUVwvMXVZS0k1emxOem1rIn0=
x-originating-ip: [10.223.10.10]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> On Wed, Aug 28, 2019 at 08:38:52PM +0530, Saranya Gopal wrote:
> > Enable static DRD mode in Intel platforms which guarantees
> > successful role switch all the time. This fixes issues like
> > software role switch failure after cold boot and issue with
> > role switch when USB 3.0 cable is used. But, do not enable
> > static DRD mode for Cherrytrail devices which rely on firmware
> > for role switch.
> >
> > Signed-off-by: Saranya Gopal <saranya.gopal@intel.com>
> > Signed-off-by: Balaji Manoharan <m.balaji@intel.com>
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> Ditto. Can't use my SoB anymore.
> 
> Note. Since I only proposed using the device property, in this patch
> you should also not use my "Suggested-by" tag. So I think it is OK to
> use it in the first patch of this series, but not in this second patch.

Sure, let me remove the tag and resend the patches.
> 
> thanks,
> 
> --
> heikki
