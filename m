Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45C312A250B
	for <lists+linux-usb@lfdr.de>; Mon,  2 Nov 2020 08:12:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727846AbgKBHMQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Nov 2020 02:12:16 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:42944 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727743AbgKBHMP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Nov 2020 02:12:15 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A279b53028997;
        Mon, 2 Nov 2020 07:12:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=ykRZLQk2o8qaHdfJW9pbqyXLl62nvZH+r5rJ6Oco6/4=;
 b=LgJJGvYVjVtpKDqtuoMxRzqPZvJZ44juAkV3l/UiyIHaAPYTUN09l4XSXHalTnTytMwM
 j6AxQi1NBNDOEymhyGTvShhaYHfN6Jj+yG8Xj2nRtY0+pX6O2VIwcFtMRnnvTfu1FH7D
 mNLbJu1W3BdqXvxiWpquDpMwQ+p7lfj0ZAnqhwuEGIqC8Jf/7zdZgHb/YjmAi/DK0PJw
 3qkQiss+0JOdW1uBCes+mvBNQKzR5ae+aU4QKZEe681cbpjl7F0YLKDly1x0n4vntJsQ
 BKZNOFqVdPl0ICkL4LVlbBkNy9jzf1tQVRqnq2yz1hO67XgZUSSEgn3D4bohQptn6P1g kg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2130.oracle.com with ESMTP id 34hhb1tc11-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 02 Nov 2020 07:12:12 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A27AiTL154097;
        Mon, 2 Nov 2020 07:12:12 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by aserp3030.oracle.com with ESMTP id 34hvrmw5ge-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 02 Nov 2020 07:12:12 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0A27C9e1025772;
        Mon, 2 Nov 2020 07:12:11 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sun, 01 Nov 2020 23:12:09 -0800
Date:   Mon, 2 Nov 2020 10:11:58 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     peter.chen@nxp.com
Cc:     linux-usb@vger.kernel.org
Subject: [bug report] usb: cdns3: gadget: improve the dump TRB operation at
 cdns3_ep_run_transfer
Message-ID: <20201102071158.GA3882381@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9792 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=706 adultscore=0
 malwarescore=0 mlxscore=0 suspectscore=10 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011020055
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9792 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0
 suspectscore=10 clxscore=1011 mlxlogscore=734 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2011020055
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Peter Chen,

The patch 4e218882eb5a: "usb: cdns3: gadget: improve the dump TRB
operation at cdns3_ep_run_transfer" from Sep 10, 2020, leads to the
following static checker warning:

	drivers/usb/cdns3/gadget.c:1305 cdns3_ep_run_transfer()
	error: uninitialized symbol 'link_trb'.

drivers/usb/cdns3/gadget.c
  1111  static int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
  1112                                   struct usb_request *request)
  1113  {
  1114          struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
  1115          struct cdns3_request *priv_req;
  1116          struct cdns3_trb *trb;
  1117          struct cdns3_trb *link_trb;
  1118          dma_addr_t trb_dma;
  1119          u32 togle_pcs = 1;
  1120          int sg_iter = 0;
  1121          int num_trb;
  1122          int address;
  1123          u32 control;
  1124          int pcs;
  1125          u16 total_tdl = 0;
  1126          struct scatterlist *s = NULL;
  1127          bool sg_supported = !!(request->num_mapped_sgs);
  1128  
  1129          if (priv_ep->type == USB_ENDPOINT_XFER_ISOC)
  1130                  num_trb = priv_ep->interval;
  1131          else
  1132                  num_trb = sg_supported ? request->num_mapped_sgs : 1;

num_trb set here.

  1133  
  1134          if (num_trb > priv_ep->free_trbs) {
  1135                  priv_ep->flags |= EP_RING_FULL;
  1136                  return -ENOBUFS;
  1137          }
  1138  
  1139          priv_req = to_cdns3_request(request);
  1140          address = priv_ep->endpoint.desc->bEndpointAddress;
  1141  
  1142          priv_ep->flags |= EP_PENDING_REQUEST;
  1143  
  1144          /* must allocate buffer aligned to 8 */
  1145          if (priv_req->flags & REQUEST_UNALIGNED)
  1146                  trb_dma = priv_req->aligned_buf->dma;
  1147          else
  1148                  trb_dma = request->dma;
  1149  
  1150          trb = priv_ep->trb_pool + priv_ep->enqueue;
  1151          priv_req->start_trb = priv_ep->enqueue;
  1152          priv_req->trb = trb;
  1153  
  1154          cdns3_select_ep(priv_ep->cdns3_dev, address);
  1155  
  1156          /* prepare ring */
  1157          if ((priv_ep->enqueue + num_trb)  >= (priv_ep->num_trbs - 1)) {
  1158                  int doorbell, dma_index;
  1159                  u32 ch_bit = 0;
  1160  
  1161                  doorbell = !!(readl(&priv_dev->regs->ep_cmd) & EP_CMD_DRDY);
  1162                  dma_index = cdns3_get_dma_pos(priv_dev, priv_ep);
  1163  
  1164                  /* Driver can't update LINK TRB if it is current processed. */
  1165                  if (doorbell && dma_index == priv_ep->num_trbs - 1) {
  1166                          priv_ep->flags |= EP_DEFERRED_DRDY;
  1167                          return -ENOBUFS;
  1168                  }
  1169  
  1170                  /*updating C bt in  Link TRB before starting DMA*/
  1171                  link_trb = priv_ep->trb_pool + (priv_ep->num_trbs - 1);
  1172                  /*
  1173                   * For TRs size equal 2 enabling TRB_CHAIN for epXin causes
  1174                   * that DMA stuck at the LINK TRB.
  1175                   * On the other hand, removing TRB_CHAIN for longer TRs for
  1176                   * epXout cause that DMA stuck after handling LINK TRB.
  1177                   * To eliminate this strange behavioral driver set TRB_CHAIN
  1178                   * bit only for TR size > 2.
  1179                   */
  1180                  if (priv_ep->type == USB_ENDPOINT_XFER_ISOC ||
  1181                      TRBS_PER_SEGMENT > 2)
  1182                          ch_bit = TRB_CHAIN;
  1183  
  1184                  link_trb->control = cpu_to_le32(((priv_ep->pcs) ? TRB_CYCLE : 0) |
  1185                                      TRB_TYPE(TRB_LINK) | TRB_TOGGLE | ch_bit);
  1186          }

link_trb not set on else path.

  1187  
  1188          if (priv_dev->dev_ver <= DEV_VER_V2)
  1189                  togle_pcs = cdns3_wa1_update_guard(priv_ep, trb);
  1190  

[ snip ]

  1296  
  1297          if (priv_dev->dev_ver <= DEV_VER_V2)
  1298                  cdns3_wa1_tray_restore_cycle_bit(priv_dev, priv_ep);
  1299  
  1300          if (num_trb > 1) {
  1301                  int i = 0;
  1302  
  1303                  while (i < num_trb) {
  1304                          trace_cdns3_prepare_trb(priv_ep, trb + i);
  1305                          if (trb + i == link_trb) {
                                               ^^^^^^^^
Potentially uninitialized.

  1306                                  trb = priv_ep->trb_pool;
  1307                                  num_trb = num_trb - i;
  1308                                  i = 0;
  1309                          } else {
  1310                                  i++;
  1311                          }
  1312                  }
  1313          } else {

regards,
dan carpenter
