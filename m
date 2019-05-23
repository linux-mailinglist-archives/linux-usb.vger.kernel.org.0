Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6907028D25
	for <lists+linux-usb@lfdr.de>; Fri, 24 May 2019 00:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388730AbfEWWbt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 May 2019 18:31:49 -0400
Received: from smtprelay-out1.synopsys.com ([198.182.61.142]:49842 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387616AbfEWWbs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 May 2019 18:31:48 -0400
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com [10.13.135.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DFE9DC00C8;
        Thu, 23 May 2019 22:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1558650693; bh=iDPWV410FZx2ORy35lJtVoKmHiD8h/JBBFvQb2xdHUM=;
        h=From:To:CC:Subject:Date:References:From;
        b=hWAQzcggEmi8vSCxBs39wlOTa0bf4kt2w47ZjQCui9CI4UE3xqcJ5+X2f4IBpO4Jo
         56DFgoWW+/0AYSrVfydtZnrw0ouuizsEPDqadO2Rrf74zoEGeAhraLn/6C3SrS5Szf
         LlvPn29X4DZbswkFXZY9iJH2wl5v2BC0PleiC8UkLPCWDl/sswC2FP0auTOnK4oO6M
         0B/XYopWi9Luv6JJzQTqOi9ppbomVtwTnqV48OKXOHDzpZooexP6bcq7Wbufxzv0dg
         SbRHPhe60W4dD/SGVnoYVrk2H8aoy+vUrlVxioOx3a0AYrEBHW7UojPFpVEvazCPZ2
         A3HBkVlaFCs6w==
Received: from US01WEHTC2.internal.synopsys.com (us01wehtc2.internal.synopsys.com [10.12.239.237])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 4E064A005D;
        Thu, 23 May 2019 22:31:45 +0000 (UTC)
Received: from us01wembx1.internal.synopsys.com ([169.254.1.22]) by
 US01WEHTC2.internal.synopsys.com ([10.12.239.237]) with mapi id
 14.03.0415.000; Thu, 23 May 2019 15:31:45 -0700
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Baruch Siach <baruch@tkos.co.il>, Jun Li <jun.li@nxp.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v2] usb: dwc3: move core validation to be after clks
 enable
Thread-Topic: [PATCH v2] usb: dwc3: move core validation to be after clks
 enable
Thread-Index: AQHVBYwmwgoFIPzeoU+y0VWKj8yWsw==
Date:   Thu, 23 May 2019 22:31:44 +0000
Message-ID: <30102591E157244384E984126FC3CB4F639FFEE3@us01wembx1.internal.synopsys.com>
References: <1557311367-5863-1-git-send-email-jun.li@nxp.com>
 <20190523151520.pa4zkby24cktnvl6@tarshish>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.13.184.19]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Baruch,=0A=
=0A=
Baruch Siach wrote:=0A=
> Hi Jun Li,=0A=
>=0A=
> On Wed, May 08, 2019 at 10:52:37AM +0000, Jun Li wrote:=0A=
>> From: Jun Li <jun.li@nxp.com>=0A=
>>=0A=
>> Register access in core validation may hang before the bulk=0A=
>> clks are enabled.=0A=
> This patch fixes the hang issue for on my i.MX8MQ based system.=0A=
>=0A=
> Tested-by: Baruch Siach <baruch@tkos.co.il>=0A=
>=0A=
> However, commit b873e2d0ea1e is meant to move dwc3_core_is_valid() before=
 =0A=
> dwc3_get_dr_mode(). With this patch dwc3_get_dr_mode() is called from =0A=
> dwc3_get_properties() before dwc3_core_is_valid().=0A=
>=0A=
> I guess we need a larger change in the initialization sequence.=0A=
>=0A=
> Thanks,=0A=
> baruch=0A=
>=0A=
=0A=
Look again. dwc3_get_dr_mode() is not called from dwc3_get_properties().=0A=
=0A=
This patch is fine.=0A=
=0A=
BR,=0A=
Thinh=0A=
