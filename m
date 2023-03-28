Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F8986CB606
	for <lists+linux-usb@lfdr.de>; Tue, 28 Mar 2023 07:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbjC1FZd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Mar 2023 01:25:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjC1FZc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Mar 2023 01:25:32 -0400
X-Greylist: delayed 5414 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 27 Mar 2023 22:25:30 PDT
Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com [148.163.133.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C78AA3
        for <linux-usb@vger.kernel.org>; Mon, 27 Mar 2023 22:25:30 -0700 (PDT)
Received: from pps.filterd (m0170393.ppops.net [127.0.0.1])
        by mx0a-00154904.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32S1KNc0003489
        for <linux-usb@vger.kernel.org>; Mon, 27 Mar 2023 23:55:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=smtpout1;
 bh=sGNkvaGEEB1jJ11zQG5giaBZIdOtNOP44+5Z8edDypY=;
 b=nGCcN0ltZqsMk3CfMEKMlrk6D/OjkU4RlCUamvdWn5nP0+BptIobSXwZPzo/ct6ISwdj
 3v48zUrFwjvYO8T0bUq8XGAG1w1tnvxV1mG9/+KqWbHK4e/9CeI/mewWnys6lz8+u8sA
 gU4BbhKLBxDn8x4YzCAt0N3Xxbur5fw+/fpcwnnlLHEObjuZOl1yLQwoweXyFSFRtihh
 xSRfd56oQ2Z24aMsmEOadaPJRJLMt9ck3eNR8pxQO/H1ITJ917k6P/KNrG/K88fQ7r1P
 itslPx0j8iiGZ0ODKRXRZvi6uYjtK5fVCzcN1xMrKneIlbVmRbWsiRuxU9cmYzxivI/J NA== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com [67.231.157.37])
        by mx0a-00154904.pphosted.com (PPS) with ESMTPS id 3phv9q8e45-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-usb@vger.kernel.org>; Mon, 27 Mar 2023 23:55:16 -0400
Received: from pps.filterd (m0089483.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32S19SNq020862
        for <linux-usb@vger.kernel.org>; Mon, 27 Mar 2023 23:55:15 -0400
Received: from esaplrlyps302.us.dell.com ([143.166.145.26])
        by mx0b-00154901.pphosted.com (PPS) with ESMTPS id 3pka5gkxs6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-usb@vger.kernel.org>; Mon, 27 Mar 2023 23:55:14 -0400
X-PREM-Routing: D-Outbound
X-PREM-Routing: D-Outbound
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="52982501"
Received: from unknown (HELO dell-Virtual-Machine.mshome.net) ([10.107.232.75])
  by esaplrlyps302.us.dell.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 22:55:02 -0500
From:   Kangzhen Lou <kangzhen.lou@dell.com>
To:     gregkh@linuxfoundation.org
Cc:     kangzhen.lou@dell.com, linux-usb@vger.kernel.org, oliver@neukum.org
Subject: Re: [PATCH] net: cdc_ncm: support ACPI MAC address pass through functionality Message-ID: <ZAm+irMSf7FrcGK3@kroah.com>
Date:   Tue, 28 Mar 2023 11:54:43 +0800
Message-Id: <20230328035443.4063-1-kangzhen.lou@dell.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZAm+irMSf7FrcGK3@kroah.com>
References: <20230309083436.6729-1-kangzhen.lou@dell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=972
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303280030
X-Proofpoint-ORIG-GUID: 3Fyp4H6s34HmO74iqxdgOawbE1fLh6eu
X-Proofpoint-GUID: 3Fyp4H6s34HmO74iqxdgOawbE1fLh6eu
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303280030
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> On Thu, Mar 09, 2023 at 04:34:36PM +0800, Kangzhen Lou wrote:
> > Make cdc_ncm to support ACPI MAC address pass through functionality
> > that also exists in the Realtek r8152 driver.
> >
> > RTL8153DD will load cdc_ncm driver by default with mainline 6.2 kernel.
> > This is to support Realtek RTL8153DD Ethernet Interface Controller's
> > MAC pass through function which used in dock, dongle or monitor.
> >
> > Although there is patch “ec51fbd1b8a2bca2948dede99c14ec63dc57ff6b”
> > will make RTL8153DD load r8152-cfgselector instead cdc_ncm driver,
> > would also submit this patch in case anyone need this feature in
> > cdc_ncm in the future.
> 
> Please reference commits in the correct way, as documented:
> 	ec51fbd1b8a2 ("r8152: add USB device driver for config selection")
> 
Thanks for reminder, my fault.

> But because of that commit, why is your change needed at all?

Because RTL8153DD supports both r8152 and cdc_ncm driver, and user can
select to load one of them by udev rule, in case someone want to load
cdc_ncm driver with MAC pass through function.

> 
> >
> > Signed-off-by: Kangzhen Lou <kangzhen.lou@dell.com>
> > ---
> >  drivers/net/usb/cdc_ncm.c | 199
> > +++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 197 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
> > index 6ce8f4f0c70e..8179516b819c 100644
> > --- a/drivers/net/usb/cdc_ncm.c
> > +++ b/drivers/net/usb/cdc_ncm.c
> > @@ -53,6 +53,7 @@
> >  #include <linux/usb/usbnet.h>
> >  #include <linux/usb/cdc.h>
> >  #include <linux/usb/cdc_ncm.h>
> > +#include <linux/acpi.h>
> 
> What about non-acpi systems?

About non-acpi system, it should return at first place:

	if (!ACPI_SUCCESS(status))
		return -ENODEV;

If I don't answer your question, may I know your thought?

> 
> >
> >  #if IS_ENABLED(CONFIG_USB_NET_CDC_MBIM)
> >  static bool prefer_mbim = true;
> > @@ -814,6 +815,177 @@ static const struct net_device_ops
> cdc_ncm_netdev_ops = {
> >  	.ndo_validate_addr   = eth_validate_addr,
> >  };
> >
> > +int acpi_mac_passthru_invalid(void)
> > +{
> > +	acpi_status status;
> > +	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
> > +	union acpi_object *obj;
> > +	int ret = -EINVAL;
> > +
> > +	/* returns _AUXMAC_#AABBCCDDEEFF# */
> > +	status = acpi_evaluate_object(NULL, "\\_SB.AMAC", NULL, &buffer);
> > +	obj = (union acpi_object *)buffer.pointer;
> > +
> > +	if (!ACPI_SUCCESS(status))
> > +		return -ENODEV;
> > +	if (obj->type != ACPI_TYPE_BUFFER || obj->string.length != 0x17) {
> > +		acpi_info("Invalid buffer for pass-thru MAC addr:
> (%d, %d)\n",
> > +			  obj->type, obj->string.length);
> 
> Why is that an "info" message?

For the BIOS have different "\\_SB.AMAC" acpi object definition, may run
into here. I'm ok change to acpi_warning.

> 
> > +		goto amacout;
> > +	}
> > +	if (strncmp(obj->string.pointer, "_AUXMAC_#", 9) != 0 ||
> > +	    strncmp(obj->string.pointer + 0x15, "#", 1) != 0) {
> > +		acpi_info("Invalid header when reading pass-thru MAC
> addr\n");
> 
> Again, info?  Shouldn't this be an error?  Or just debug as userspace
> can't do anything about it.

If user disable MAC pass through in BIOS, it will also run into here.
So it's not an error. Depends on user selection in BIOS.

> 
> > +		goto amacout;
> > +	}
> > +	/* return success, otherwise return non-zero if invalid buffer read or
> > +	 * MAC pass through is disabled in BIOS
> > +	 */
> > +	ret = 0;
> > +
> > +amacout:
> > +	kfree(obj);
> > +	return ret;
> > +}
> > +
> > +int get_acpi_mac_passthru(char *MACAddress) {
> > +	acpi_status status;
> > +	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
> > +	union acpi_object *obj;
> > +	int ret = -EINVAL;
> > +	unsigned char buf[6];
> > +
> > +	/* returns _AUXMAC_#AABBCCDDEEFF# */
> > +	status = acpi_evaluate_object(NULL, "\\_SB.AMAC", NULL, &buffer);
> > +	obj = (union acpi_object *)buffer.pointer;
> > +
> > +	if (!ACPI_SUCCESS(status))
> > +		return -ENODEV;
> > +
> > +	ret = hex2bin(buf, obj->string.pointer + 9, 6);
> > +	if (!(ret == 0 && is_valid_ether_addr(buf))) {
> > +		acpi_info("Invalid MAC for pass-thru MAC addr: %d, %pM\n",
> > +			  ret, buf);
> > +		ret = -EINVAL;
> > +		goto amacout;
> > +	}
> > +	memcpy(MACAddress, buf, 6);
> > +	acpi_info("Pass-thru MAC addr %pM\n", MACAddress);
> > +
> > +amacout:
> > +	kfree(obj);
> > +	return ret;
> > +}
> > +
> > +/* Provide method to get MAC address from the USB device's ethernet
> controller.
> > + * If the device supports CDC_GET_ADDRESS, we should receive just six
> bytes.
> > + * Otherwise, use the prior method by asking for the descriptor.
> > + */
> > +static int cdc_ncm_get_ethernet_address(struct usbnet *dev,
> > +					struct cdc_ncm_ctx *ctx)
> > +{
> > +	int ret;
> > +	u8 iface_no = ctx->control->cur_altsetting->desc.bInterfaceNumber;
> > +
> > +	ret = usbnet_read_cmd(dev, USB_CDC_GET_NET_ADDRESS,
> > +			      USB_DIR_IN | USB_TYPE_CLASS
> > +			      | USB_RECIP_INTERFACE, 0,
> > +			      iface_no, dev->net->dev_addr, ETH_ALEN);
> > +
> > +	if (ret == ETH_ALEN) {
> > +		ret = 0;	/* success */
> > +	} else {
> > +		ret = usbnet_get_ethernet_addr(dev,
> > +				ctx->ether_desc->iMACAddress);
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +/* Provide method to push MAC address to the USB device's ethernet
> controller.
> > + * If the device does not support CDC_SET_ADDRESS, there is no harm
> > +and we
> > + * proceed as before.
> > + */
> > +static int cdc_ncm_set_ethernet_address(struct usbnet *dev,
> > +					struct sockaddr *addr)
> > +{
> > +	int ret;
> > +	struct cdc_ncm_ctx *ctx = (struct cdc_ncm_ctx *)dev->data[0];
> > +	u8 iface_no_data = ctx->data->cur_altsetting-
> >desc.bInterfaceNumber;
> > +	u8 iface_no_control = ctx->control->cur_altsetting-
> >desc.bInterfaceNumber;
> > +	int temp;
> > +
> > +	/* The host shall only send SET_NET_ADDRESS command while
> > +	 * the NCM Data Interface is in alternate setting 0.
> > +	 */
> > +	temp = usb_set_interface(dev->udev, iface_no_data, 0);
> > +	if (temp) {
> > +		dev_dbg(&dev->udev->dev, "set interface failed\n");
> > +		return -ENODEV;
> > +		}
> 
> Always use checkpatch.pl before submitting patches so you don't get grumpy
> reviewers telling you to use checkpatch.pl.

I did run checkpatch.pl before submitting patches to make sure 0 error and
0 warning. Thanks for reminder again.

> 
> thanks,
> 
> greg k-h
