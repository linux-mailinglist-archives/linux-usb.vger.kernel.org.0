Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24E8868CF9C
	for <lists+linux-usb@lfdr.de>; Tue,  7 Feb 2023 07:42:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbjBGGmc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Feb 2023 01:42:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbjBGGma (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Feb 2023 01:42:30 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8327712079
        for <linux-usb@vger.kernel.org>; Mon,  6 Feb 2023 22:42:12 -0800 (PST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3174ufnb010804;
        Tue, 7 Feb 2023 06:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=2LkJg2ZnEWx29TjnHUGzl3BKfN8hw/Z4GMJ0J0v6cbc=;
 b=X+wLIjgY16QkJalU9+cGTXPT2+CiEvh+p7nR+Fpgg1Q9Q37FQJFNTOs/XdxueDJ56tLf
 mIzpSa4tuLbHl2PjDMsVjKk3PJqRql/jtjuyflULlIMltIGhoLbS92cAtXJO0jWEFIzB
 /4LSBOW8F/qT7uftfDtmRB7N06X9ZUvE5AnPCahJhUBPfczLkZZI7wJLZ3k/o+uqEIGX
 V4rA7tSJ5uaAxKL0bdSm61Nd4kNdp6zfFzSsdvgmeaS5KNb3MwddBlYP6CtNcnWZJyXN
 uTAvmftlUfSNSO4Wnvh1ONP5WGJbRUJV/a0nvYEwAS2B8ieVK3/DDWSLFuqyFDL45+YW 5A== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nkdun8gpj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 07 Feb 2023 06:42:09 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3176g8dk015309
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 7 Feb 2023 06:42:08 GMT
Received: from linyyuan-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 6 Feb 2023 22:42:06 -0800
From:   Linyu Yuan <quic_linyyuan@quicinc.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, Jack Pham <quic_jackp@quicinc.com>,
        "Wesley Cheng" <quic_wcheng@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: [PATCH] usb: typec: disable pm for typec class devices
Date:   Tue, 7 Feb 2023 14:42:02 +0800
Message-ID: <1675752122-8147-1-git-send-email-quic_linyyuan@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MXrlMHv5WwGwhvy7vSH12rj8VSB1DvH4
X-Proofpoint-ORIG-GUID: MXrlMHv5WwGwhvy7vSH12rj8VSB1DvH4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_07,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=805 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070060
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

as there is no pm operation, call device_set_pm_not_required() to disable
all typec class devices.

Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
---
 drivers/usb/typec/class.c   | 5 +++++
 drivers/usb/typec/mux.c     | 2 ++
 drivers/usb/typec/pd.c      | 3 +++
 drivers/usb/typec/retimer.c | 1 +
 4 files changed, 11 insertions(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index ed3d070..b75ec6d 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -548,6 +548,7 @@ typec_register_altmode(struct device *parent,
 	alt->adev.dev.groups = alt->groups;
 	alt->adev.dev.type = &typec_altmode_dev_type;
 	dev_set_name(&alt->adev.dev, "%s.%u", dev_name(parent), id);
+	device_set_pm_not_required(&alt->adev.dev);
 
 	/* Link partners and plugs with the ports */
 	if (!is_port)
@@ -880,6 +881,7 @@ struct typec_partner *typec_register_partner(struct typec_port *port,
 	partner->dev.parent = &port->dev;
 	partner->dev.type = &typec_partner_dev_type;
 	dev_set_name(&partner->dev, "%s-partner", dev_name(&port->dev));
+	device_set_pm_not_required(&partner->dev);
 
 	ret = device_register(&partner->dev);
 	if (ret) {
@@ -1032,6 +1034,7 @@ struct typec_plug *typec_register_plug(struct typec_cable *cable,
 	plug->dev.parent = &cable->dev;
 	plug->dev.type = &typec_plug_dev_type;
 	dev_set_name(&plug->dev, "%s-%s", dev_name(cable->dev.parent), name);
+	device_set_pm_not_required(&plug->dev);
 
 	ret = device_register(&plug->dev);
 	if (ret) {
@@ -1197,6 +1200,7 @@ struct typec_cable *typec_register_cable(struct typec_port *port,
 	cable->dev.parent = &port->dev;
 	cable->dev.type = &typec_cable_dev_type;
 	dev_set_name(&cable->dev, "%s-cable", dev_name(&port->dev));
+	device_set_pm_not_required(&cable->dev);
 
 	ret = device_register(&cable->dev);
 	if (ret) {
@@ -2260,6 +2264,7 @@ struct typec_port *typec_register_port(struct device *parent,
 	port->dev.fwnode = cap->fwnode;
 	port->dev.type = &typec_port_dev_type;
 	dev_set_name(&port->dev, "port%d", id);
+	device_set_pm_not_required(&port->dev);
 	dev_set_drvdata(&port->dev, cap->driver_data);
 
 	port->cap = kmemdup(cap, sizeof(*cap), GFP_KERNEL);
diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index c7177dd..55b5417 100644
--- a/drivers/usb/typec/mux.c
+++ b/drivers/usb/typec/mux.c
@@ -183,6 +183,7 @@ typec_switch_register(struct device *parent,
 	sw_dev->dev.class = &typec_mux_class;
 	sw_dev->dev.type = &typec_switch_dev_type;
 	sw_dev->dev.driver_data = desc->drvdata;
+	device_set_pm_not_required(&sw_dev->dev);
 	ret = dev_set_name(&sw_dev->dev, "%s-switch", desc->name ? desc->name : dev_name(parent));
 	if (ret) {
 		put_device(&sw_dev->dev);
@@ -470,6 +471,7 @@ typec_mux_register(struct device *parent, const struct typec_mux_desc *desc)
 	mux_dev->dev.class = &typec_mux_class;
 	mux_dev->dev.type = &typec_mux_dev_type;
 	mux_dev->dev.driver_data = desc->drvdata;
+	device_set_pm_not_required(&mux_dev->dev);
 	ret = dev_set_name(&mux_dev->dev, "%s-mux", desc->name ? desc->name : dev_name(parent));
 	if (ret) {
 		put_device(&mux_dev->dev);
diff --git a/drivers/usb/typec/pd.c b/drivers/usb/typec/pd.c
index dc72005..252ef51 100644
--- a/drivers/usb/typec/pd.c
+++ b/drivers/usb/typec/pd.c
@@ -428,6 +428,7 @@ static int add_pdo(struct usb_power_delivery_capabilities *cap, u32 pdo, int pos
 	p->dev.parent = &cap->dev;
 	p->dev.type = type;
 	dev_set_name(&p->dev, "%u:%s", position + 1, name);
+	device_set_pm_not_required(&p->dev);
 
 	ret = device_register(&p->dev);
 	if (ret) {
@@ -490,6 +491,7 @@ usb_power_delivery_register_capabilities(struct usb_power_delivery *pd,
 	cap->dev.parent = &pd->dev;
 	cap->dev.type = &pd_capabilities_type;
 	dev_set_name(&cap->dev, "%s", cap_name[cap->role]);
+	device_set_pm_not_required(&cap->dev);
 
 	ret = device_register(&cap->dev);
 	if (ret) {
@@ -626,6 +628,7 @@ usb_power_delivery_register(struct device *parent, struct usb_power_delivery_des
 	pd->dev.type = &pd_type;
 	pd->dev.class = &pd_class;
 	dev_set_name(&pd->dev, "pd%d", pd->id);
+	device_set_pm_not_required(&pd->dev);
 
 	ret = device_register(&pd->dev);
 	if (ret) {
diff --git a/drivers/usb/typec/retimer.c b/drivers/usb/typec/retimer.c
index 0481e82..99105c9 100644
--- a/drivers/usb/typec/retimer.c
+++ b/drivers/usb/typec/retimer.c
@@ -122,6 +122,7 @@ typec_retimer_register(struct device *parent, const struct typec_retimer_desc *d
 	retimer->dev.class = &retimer_class;
 	retimer->dev.type = &typec_retimer_dev_type;
 	retimer->dev.driver_data = desc->drvdata;
+	device_set_pm_not_required(&retimer->dev);
 	dev_set_name(&retimer->dev, "%s-retimer",
 		     desc->name ? desc->name : dev_name(parent));
 
-- 
2.7.4

