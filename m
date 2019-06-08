Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2169039C1B
	for <lists+linux-usb@lfdr.de>; Sat,  8 Jun 2019 11:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbfFHJ0T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 8 Jun 2019 05:26:19 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:53096 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726478AbfFHJ0S (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 8 Jun 2019 05:26:18 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x589J0Qh027512;
        Sat, 8 Jun 2019 09:26:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=d+lbfrh1KXUn5GjnVRz4M0qRKs5k85H9cFv8uDzyNb8=;
 b=t/Xnm6g0J7eytzX052+Y/kH6xH27phfzQFoGtEjLyAKoQQ+O9vCQpHRscjagssvChN0U
 cR+HGrMbFuU0kFpXFtlF8bl8xcOooCeaHYa3DmLzkrvxKVqK6CLz36wbRHTqETKV8Z7Z
 2hv9d+zpf/nCVJZuhjk7xuhgX7klaKC2qw/8WG/3EMj+cOfzOspYk0ErSobyhNwyNEuc
 elRAeWsumr5UO8kWlNIWOKg39DdC0pcDB78WtZ1Su7EVc1NgJVJH+U1WygsVRF2nRS1Z
 dC8PaAtBsEB8kp9pW3a3yzXfFJ9bkXZFCtla/DJsGP+eAYACndk3D+1ecDXX5xd7UTi+ WA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 2t05nq8kta-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 08 Jun 2019 09:26:11 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x589Oofa172818;
        Sat, 8 Jun 2019 09:26:11 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 2t04hx3qjg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 08 Jun 2019 09:26:11 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x589Q9Aj014477;
        Sat, 8 Jun 2019 09:26:10 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sat, 08 Jun 2019 02:26:08 -0700
Date:   Sat, 8 Jun 2019 12:26:00 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     andrzej.p@samsung.com
Cc:     linux-usb@vger.kernel.org
Subject: [bug report] usb: gadget: f_fs: OS descriptors support
Message-ID: <20190608092600.GD28890@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9281 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=1 spamscore=0 mlxscore=0 mlxlogscore=691
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906080071
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9281 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=3 spamscore=0 clxscore=1011
 lowpriorityscore=3 mlxscore=0 impostorscore=0 mlxlogscore=730 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906080071
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Andrzej Pietrasiewicz,

The patch f0175ab51993: "usb: gadget: f_fs: OS descriptors support"
from Jul 9, 2014, leads to the following static checker warning:

	drivers/usb/gadget/function/f_fs.c:2992 __ffs_func_bind_do_os_desc()
	error: 'ext_prop->data_len' from user is not capped properly

drivers/usb/gadget/function/f_fs.c
  2961                         ARRAY_SIZE(desc->CompatibleID) +
  2962                         ARRAY_SIZE(desc->SubCompatibleID));
  2963                  length = sizeof(*desc);
  2964          }
  2965                  break;
  2966          case FFS_OS_DESC_EXT_PROP: {
  2967                  struct usb_ext_prop_desc *desc = data;
  2968                  struct usb_os_desc_table *t;
  2969                  struct usb_os_desc_ext_prop *ext_prop;
  2970                  char *ext_prop_name;
  2971                  char *ext_prop_data;
  2972  
  2973                  t = &func->function.os_desc_table[h->interface];
  2974                  t->if_id = func->interfaces_nums[h->interface];
  2975  
  2976                  ext_prop = func->ffs->ms_os_descs_ext_prop_avail;
  2977                  func->ffs->ms_os_descs_ext_prop_avail += sizeof(*ext_prop);
  2978  
  2979                  ext_prop->type = le32_to_cpu(desc->dwPropertyDataType);
  2980                  ext_prop->name_len = le16_to_cpu(desc->wPropertyNameLength);
  2981                  ext_prop->data_len = le32_to_cpu(*(__le32 *)
  2982                          usb_ext_prop_data_len_ptr(data, ext_prop->name_len));

Smatch is very suspicious of "ext_prop->data_len".

  2983                  length = ext_prop->name_len + ext_prop->data_len + 14;
  2984  
  2985                  ext_prop_name = func->ffs->ms_os_descs_ext_prop_name_avail;
  2986                  func->ffs->ms_os_descs_ext_prop_name_avail +=
  2987                          ext_prop->name_len;
  2988  
  2989                  ext_prop_data = func->ffs->ms_os_descs_ext_prop_data_avail;
  2990                  func->ffs->ms_os_descs_ext_prop_data_avail +=
  2991                          ext_prop->data_len;
  2992                  memcpy(ext_prop_data,
  2993                         usb_ext_prop_data_ptr(data, ext_prop->name_len),
  2994                         ext_prop->data_len);
                               ^^^^^^^^^^^^^^^^^^
so it complians that this memcpy() can overflow.  That seems like maybe
a real issue?

  2995                  /* unicode data reported to the host as "WCHAR"s */
  2996                  switch (ext_prop->type) {
  2997                  case USB_EXT_PROP_UNICODE:
  2998                  case USB_EXT_PROP_UNICODE_ENV:
  2999                  case USB_EXT_PROP_UNICODE_LINK:
  3000                  case USB_EXT_PROP_UNICODE_MULTI:
  3001                          ext_prop->data_len *= 2;
  3002                          break;
  3003                  }
  3004                  ext_prop->data = ext_prop_data;

regards,
dan carpenter
