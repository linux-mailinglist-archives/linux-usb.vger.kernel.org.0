Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A83902D4076
	for <lists+linux-usb@lfdr.de>; Wed,  9 Dec 2020 11:59:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730297AbgLIK7Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Dec 2020 05:59:25 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:48132 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730299AbgLIK7S (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Dec 2020 05:59:18 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B9AtLuJ186493;
        Wed, 9 Dec 2020 10:58:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=VBnui0KuexPbRNCI2rw85UA2jumdEKtxwcjAMYb+9aM=;
 b=NqILz/Txkjtov/9TSIsh9pLIeHHm8imj2b/x2egSS5++74v5vR+kExXyT3TdyjWl5wna
 kezZ811JWLkeCfFBXXynFzQnc31wbwsnuK81L+GdVqHwdE18XfDWyTPP4i6EnyfOdg10
 TJ0QkvTL4Cz7sUUkWuA4PwjtV2Eh5TOPXDAbATrN+dGLnf2ZDOc5OYmLGv3aadoUh0YZ
 Mfa8gjpj3IJuWzPj0Jrlil8B6LZqhrxiS88ETdQK0BYZas5kGMtTChz51r6NO/tVi+3V
 fc3BhoojP4hHNwUqGxzoAsC31sYhQ6tljj5InpVoJ0cgjna1dFIbIsrktJmdAnjdZvyE 5g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2130.oracle.com with ESMTP id 357yqbymyn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 09 Dec 2020 10:58:36 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B9Asfr6157362;
        Wed, 9 Dec 2020 10:58:35 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 358kyuf9um-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 09 Dec 2020 10:58:35 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B9AwXaA032463;
        Wed, 9 Dec 2020 10:58:34 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 09 Dec 2020 02:58:33 -0800
Date:   Wed, 9 Dec 2020 13:58:26 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     pawell@cadence.com
Cc:     linux-usb@vger.kernel.org
Subject: [bug report] usb: cdnsp: cdns3 Add main part of Cadence USBSSP DRD
 Driver
Message-ID: <X9Ct0tXbtETTy+dq@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 mlxscore=0
 malwarescore=0 suspectscore=3 mlxlogscore=999 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012090076
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3 mlxlogscore=999
 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012090076
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Pawel Laszczak,

The patch d40a169aab24: "usb: cdnsp: cdns3 Add main part of Cadence
USBSSP DRD Driver" from Dec 7, 2020, leads to the following static
checker warning:

	drivers/usb/cdns3/cdnsp-mem.c:1229 cdnsp_mem_init()
	warn: use 'flags' here instead of GFP_XXX?

drivers/usb/cdns3/cdnsp-mem.c
  1206  int cdnsp_mem_init(struct cdnsp_device *pdev, gfp_t flags)
                                                      ^^^^^^^^^^^

  1207  {
  1208          struct device *dev = pdev->dev;
  1209          int ret = -ENOMEM;
  1210          unsigned int val;
  1211          dma_addr_t dma;
  1212          u32 page_size;
  1213          u64 val_64;
  1214  
  1215          /*
  1216           * Use 4K pages, since that's common and the minimum the
  1217           * controller supports
  1218           */
  1219          page_size = 1 << 12;
  1220  
  1221          val = readl(&pdev->op_regs->config_reg);
  1222          val |= ((val & ~MAX_DEVS) | CDNSP_DEV_MAX_SLOTS) | CONFIG_U3E;
  1223          writel(val, &pdev->op_regs->config_reg);
  1224  
  1225          /*
  1226           * Doorbell array must be physically contiguous
  1227           * and 64-byte (cache line) aligned.
  1228           */
  1229          pdev->dcbaa = dma_alloc_coherent(dev, sizeof(*pdev->dcbaa),
  1230                                           &dma, GFP_KERNEL);

There is only one caller for cdnsp_mem_init() and flags is GFP_KERNEL.
It's better to just remove the argument because it's not useful.

  1231          if (!pdev->dcbaa)
  1232                  return -ENOMEM;
  1233  
  1234          memset(pdev->dcbaa, 0, sizeof(*pdev->dcbaa));
  1235          pdev->dcbaa->dma = dma;
  1236  
  1237          cdnsp_write_64(dma, &pdev->op_regs->dcbaa_ptr);
  1238  
  1239          /*
  1240           * Initialize the ring segment pool.  The ring must be a contiguous
  1241           * structure comprised of TRBs. The TRBs must be 16 byte aligned,
  1242           * however, the command ring segment needs 64-byte aligned segments
  1243           * and our use of dma addresses in the trb_address_map radix tree needs
  1244           * TRB_SEGMENT_SIZE alignment, so driver pick the greater alignment
  1245           * need.
  1246           */
  1247          pdev->segment_pool = dma_pool_create("CDNSP ring segments", dev,
  1248                                               TRB_SEGMENT_SIZE, TRB_SEGMENT_SIZE,
  1249                                               page_size);

regards,
dan carpenter
