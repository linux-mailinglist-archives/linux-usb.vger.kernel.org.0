Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBAC025180A
	for <lists+linux-usb@lfdr.de>; Tue, 25 Aug 2020 13:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729882AbgHYLui (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Aug 2020 07:50:38 -0400
Received: from mga03.intel.com ([134.134.136.65]:22727 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729953AbgHYLug (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 25 Aug 2020 07:50:36 -0400
IronPort-SDR: fPNYbSYHQwTl2fPp7O3mecfjCPOISRvsfwm5b3ok3PckdcXrHfLjdQkl98KIAtMzj3yTfXplkP
 Lp2FibWeJlfA==
X-IronPort-AV: E=McAfee;i="6000,8403,9723"; a="156083864"
X-IronPort-AV: E=Sophos;i="5.76,352,1592895600"; 
   d="scan'208";a="156083864"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2020 04:50:35 -0700
IronPort-SDR: BEg44jLfRZl8i9E3mUd3Wg5KKvozIOxIj5Z5F8iOMSsciO5ZV6VsgT3K67csJoZkRFPqWC94VZ
 ZPYuv0hZVR+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,352,1592895600"; 
   d="scan'208";a="281478878"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by fmsmga008.fm.intel.com with ESMTP; 25 Aug 2020 04:50:33 -0700
Subject: Re: Data toggles not reset on "set configuration" for ports handled
 by "xhci_hcd" driver
To:     Martin Thierer <mthierer@gmail.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
References: <CAL3BvCzb6dGZOm6jy2PddSfioM7hThMEBm+aQ_gmMAWAXFYOuQ@mail.gmail.com>
 <20200821160321.GA256196@rowland.harvard.edu>
 <CAL3BvCyz3W+aRu0e=RE3teaMMh6KDYxu8NbFicY07Xt-=f9Whg@mail.gmail.com>
 <20200821170106.GB256196@rowland.harvard.edu>
 <d11a91f5-2bb8-01ce-c8b8-4512a2cf2793@linux.intel.com>
 <CAL3BvCyxTvfUjecoYO0ie1vt4_+1cad+8Dt=xmcXogZSooGj+A@mail.gmail.com>
 <cbdfafed-b8d4-ca07-bde1-4598f5117f04@linux.intel.com>
 <a66ea20a-5406-ed31-e607-08552598ed68@linux.intel.com>
 <CAL3BvCzsAZjt23XjD-9T2JyUtLFPLB0prKn3Bw3nC4AC1nTbgA@mail.gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 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 fiD/
Message-ID: <9017830d-a4d2-66d5-6b42-b1162856ef90@linux.intel.com>
Date:   Tue, 25 Aug 2020 14:53:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAL3BvCzsAZjt23XjD-9T2JyUtLFPLB0prKn3Bw3nC4AC1nTbgA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 25.8.2020 11.00, Martin Thierer wrote:
>> Can you try the code below? It should force dropping and adding the endpoints
>> for the intrface(s) of that configuration, and xhci should reset the toggles.
>>
>> Completely untested, it compiles :)
> 
> Sorry, no, that doesn't work:
> 
> xhci_hcd 0000:00:14.0: Trying to add endpoint 0x83 without dropping it.
> BUG: kernel NULL pointer dereference, address: 0000000000000010

Ah, I see.
Endpoints weren't dropped on host side as pointer to the endpoints were cleaned up before this.
And the code to recover from a failed call got messed up as we removed some stuff it depends on.

Here's a second version. 
I'm again not able to test this at all from my current location, so it might fail because
of some silly mistake, but it compiles..

This version keeps endpoint pointers intact until endpoints are dropped from hcd side, 
it also removes the recover path (might need to fix one later) 

diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index 6197938dcc2d..e90e8781f872 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -1537,9 +1537,21 @@ int usb_reset_configuration(struct usb_device *dev)
 	 * calls during probe() are fine
 	 */
 
+	/*
+	 * TEST2 flush and disable endpoints but leave the pointers intact until
+	 * usb_hcd_alloc_bandwidth() has dropped them from host controller side
+	 */
 	for (i = 1; i < 16; ++i) {
-		usb_disable_endpoint(dev, i, true);
-		usb_disable_endpoint(dev, i + USB_DIR_IN, true);
+		if (dev->ep_out[i]) {
+			dev->ep_out[i]->enabled = 0;
+			usb_hcd_flush_endpoint(dev, dev->ep_out[i]);
+			usb_hcd_disable_endpoint(dev, dev->ep_out[i]);
+		}
+		if (dev->ep_in[i]) {
+			dev->ep_in[i]->enabled = 0;
+			usb_hcd_flush_endpoint(dev, dev->ep_in[i]);
+			usb_hcd_disable_endpoint(dev, dev->ep_in[i]);
+		}
 	}
 
 	config = dev->actconfig;
@@ -1554,33 +1566,21 @@ int usb_reset_configuration(struct usb_device *dev)
 		return -ENOMEM;
 	}
 	/* Make sure we have enough bandwidth for each alternate setting 0 */
-	for (i = 0; i < config->desc.bNumInterfaces; i++) {
-		struct usb_interface *intf = config->interface[i];
-		struct usb_host_interface *alt;
+	/* TEST drop and re-add endpoints to clear toggle */
+	retval = usb_hcd_alloc_bandwidth(dev, config, NULL, NULL);
 
-		alt = usb_altnum_to_altsetting(intf, 0);
-		if (!alt)
-			alt = &intf->altsetting[0];
-		if (alt != intf->cur_altsetting)
-			retval = usb_hcd_alloc_bandwidth(dev, NULL,
-					intf->cur_altsetting, alt);
-		if (retval < 0)
-			break;
+	/* clear the endpoint pointers, FIXME check if needed */
+	for (i = 1; i < 16; ++i) {
+		dev->ep_out[i] = NULL;
+		dev->ep_in[i] = NULL;
 	}
-	/* If not, reinstate the old alternate settings */
+
 	if (retval < 0) {
-reset_old_alts:
-		for (i--; i >= 0; i--) {
-			struct usb_interface *intf = config->interface[i];
-			struct usb_host_interface *alt;
-
-			alt = usb_altnum_to_altsetting(intf, 0);
-			if (!alt)
-				alt = &intf->altsetting[0];
-			if (alt != intf->cur_altsetting)
-				usb_hcd_alloc_bandwidth(dev, NULL,
-						alt, intf->cur_altsetting);
-		}
+		/*
+		 * Can't walk backwards and set the old alts back as we no longer
+		 * set one interface at a time, but full configuration in one go
+		 */
+
 		usb_enable_lpm(dev);
 		mutex_unlock(hcd->bandwidth_mutex);
 		return retval;
@@ -1589,8 +1589,11 @@ int usb_reset_configuration(struct usb_device *dev)
 			USB_REQ_SET_CONFIGURATION, 0,
 			config->desc.bConfigurationValue, 0,
 			NULL, 0, USB_CTRL_SET_TIMEOUT);
-	if (retval < 0)
-		goto reset_old_alts;
+	if (retval < 0) {
+		usb_enable_lpm(dev);
+		mutex_unlock(hcd->bandwidth_mutex);
+		return retval;
+	}
 	mutex_unlock(hcd->bandwidth_mutex);
 
 	/* re-init hc/hcd interface/endpoint state */
