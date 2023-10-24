Return-Path: <linux-usb+bounces-2150-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BD21F7D5C89
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 22:36:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35AD8B2108F
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 20:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC43E24212;
	Tue, 24 Oct 2023 20:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aN3ucWZZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826D33E493
	for <linux-usb@vger.kernel.org>; Tue, 24 Oct 2023 20:36:19 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1906FEA;
	Tue, 24 Oct 2023 13:36:18 -0700 (PDT)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39OCphuE008185;
	Tue, 24 Oct 2023 20:36:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=eXJedUJ+ycehchtqjsnqMajH7B3wz/3cpx05+dNOyAg=;
 b=aN3ucWZZ9fLuaiVyHsLCUmvuPYNDqWICSCHxwcCMgF240Xoy9gVNmxnWE8nS3T1wfe/r
 BSa61dBRRak59IlMdhXB7r/gEd7V1EWi5Y7A4FuRcjwbayB28qUNNrlfhnBulsqTmRSw
 WzgXE98ubwBaBFlRcfQaMEFUK0c1LT4BN9AC4MB7X1AvtGimMTK8ja3XbY6jSdTANlBt
 bZeQocRhZ/s8HVYnHqCy5t661672gwdHBo58YlBr9eNBayWTHZD0QsLALWkhS9T9eVwh
 iyqxTdO0hahGvSSp/pwHWzVqkNtILtmsnCz0PasqhA/76aTCxnacbNbbDW1nTbIFqrxv Bw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3twxa0k3y4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Oct 2023 20:36:13 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39OKaCE1025761
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Oct 2023 20:36:12 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Tue, 24 Oct 2023 13:36:12 -0700
Date: Tue, 24 Oct 2023 13:36:10 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil
 Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 1/2] usb: typec: ucsi: fix UCSI on buggy Qualcomm devices
Message-ID: <20231024203610.GQ3553829@hu-bjorande-lv.qualcomm.com>
References: <20231023215327.695720-1-dmitry.baryshkov@linaro.org>
 <20231023215327.695720-2-dmitry.baryshkov@linaro.org>
 <20231023224715.GN3553829@hu-bjorande-lv.qualcomm.com>
 <CAA8EJppen6Ebmv_fjdrHoUXRsFFH5TZonKck=bRDKgXTTWOxoQ@mail.gmail.com>
 <20231024164254.GP3553829@hu-bjorande-lv.qualcomm.com>
 <CAA8EJpqbxAo8kxw6RXx18dyT0X9us=2p=bNCxJNHk6aP5012Sg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAA8EJpqbxAo8kxw6RXx18dyT0X9us=2p=bNCxJNHk6aP5012Sg@mail.gmail.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -axzLO9-FM7kFc7wVW6ZVMLi3jRQUvBj
X-Proofpoint-ORIG-GUID: -axzLO9-FM7kFc7wVW6ZVMLi3jRQUvBj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-24_20,2023-10-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 mlxscore=0 phishscore=0 mlxlogscore=775 impostorscore=0 clxscore=1015
 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310170001
 definitions=main-2310240177

On Tue, Oct 24, 2023 at 11:13:55PM +0300, Dmitry Baryshkov wrote:
> On Tue, 24 Oct 2023 at 19:42, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
> >
> > On Tue, Oct 24, 2023 at 02:08:33AM +0300, Dmitry Baryshkov wrote:
> > > On Tue, 24 Oct 2023 at 01:47, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
> > > >
> > > > On Tue, Oct 24, 2023 at 12:47:26AM +0300, Dmitry Baryshkov wrote:
> > > > > On sevral Qualcomm platforms (SC8180X, SM8350, SC8280XP) a call to
> > > > > UCSI_GET_PDOS for non-PD partners will cause a firmware crash with no
> > > > > easy way to recover from it. Since we have no easy way to determine
> > > > > whether the partner really has PD support, shortcut UCSI_GET_PDOS on
> > > > > such platforms. This allows us to enable UCSI support on such devices.
> > > > >
> > > >
> > > > Really nice to see this. Thanks.
> > > >
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > ---
> > > > >  drivers/usb/typec/ucsi/ucsi.c       | 3 +++
> > > > >  drivers/usb/typec/ucsi/ucsi.h       | 3 +++
> > > > >  drivers/usb/typec/ucsi/ucsi_glink.c | 3 +++
> > > > >  3 files changed, 9 insertions(+)
> > > > >
> > > > > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> > > > > index 61b64558f96c..5392ec698959 100644
> > > > > --- a/drivers/usb/typec/ucsi/ucsi.c
> > > > > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > > > > @@ -578,6 +578,9 @@ static int ucsi_read_pdos(struct ucsi_connector *con,
> > > > >       u64 command;
> > > > >       int ret;
> > > > >
> > > > > +     if (ucsi->quirks & UCSI_NO_PARTNER_PDOS)
> > > > > +             return 0;
> > > > > +
> > > > >       command = UCSI_COMMAND(UCSI_GET_PDOS) | UCSI_CONNECTOR_NUMBER(con->num);
> > > > >       command |= UCSI_GET_PDOS_PARTNER_PDO(is_partner);
> > > > >       command |= UCSI_GET_PDOS_PDO_OFFSET(offset);
> > > > > diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> > > > > index 474315a72c77..6478016d5cb8 100644
> > > > > --- a/drivers/usb/typec/ucsi/ucsi.h
> > > > > +++ b/drivers/usb/typec/ucsi/ucsi.h
> > > > > @@ -317,6 +317,9 @@ struct ucsi {
> > > > >  #define EVENT_PENDING        0
> > > > >  #define COMMAND_PENDING      1
> > > > >  #define ACK_PENDING  2
> > > > > +
> > > > > +     unsigned long quirks;
> > > > > +#define UCSI_NO_PARTNER_PDOS BIT(0)  /* Don't read partner's PDOs */
> > > > >  };
> > > > >
> > > > >  #define UCSI_MAX_SVID                5
> > > > > diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
> > > > > index db6e248f8208..5c159e7b2b65 100644
> > > > > --- a/drivers/usb/typec/ucsi/ucsi_glink.c
> > > > > +++ b/drivers/usb/typec/ucsi/ucsi_glink.c
> > > > > @@ -327,6 +327,8 @@ static int pmic_glink_ucsi_probe(struct auxiliary_device *adev,
> > > > >       if (ret)
> > > > >               return ret;
> > > > >
> > > > > +     ucsi->ucsi->quirks = id->driver_data;
> > > > > +
> > > > >       ucsi_set_drvdata(ucsi->ucsi, ucsi);
> > > > >
> > > > >       device_for_each_child_node(dev, fwnode) {
> > > > > @@ -379,6 +381,7 @@ static void pmic_glink_ucsi_remove(struct auxiliary_device *adev)
> > > > >
> > > > >  static const struct auxiliary_device_id pmic_glink_ucsi_id_table[] = {
> > > > >       { .name = "pmic_glink.ucsi", },
> > > > > +     { .name = "pmic_glink.ucsi-no-pdos", .driver_data = UCSI_NO_PARTNER_PDOS, },
> > > >
> > > > In altmode and battmgr drivers we apply quirks based on the compatible
> > > > of the pmic_glink of_node.
> > >
> > > ... and I can't say that I like that. In typical drivers we perform
> > > driver tuning by looking at the device's data (e.g. by using
> > > of_device_is_compatible or by of_device_get_match_data. Checking the
> > > parent device seems like breaking the layering.
> >
> > It felt like it was the cleaner option of the two when I did it. I think
> > there was some variation of quirks which made me feel this would grow
> > large - but I might misremember things now.
> >
> > > But if you insist, I can follow that approach.
> >
> > I insist that we should use the same mechanism of dealing with the
> > quirks across the three parts, and following the existing approach
> > doesn't seem too unreasonable...
> 
> The problem with the current approach is that it adds dependency
> between patches. We can not apply patch2 without patch1 being in
> place, since applying will enable buggy UCSI.
> 

Good point. Please describe this dependency when you respin the patches,
and we can take them together through the USB tree.

Regards,
Bjorn

