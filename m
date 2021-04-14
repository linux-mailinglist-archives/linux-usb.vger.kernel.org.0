Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8B4B35ED43
	for <lists+linux-usb@lfdr.de>; Wed, 14 Apr 2021 08:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237181AbhDNGiN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Apr 2021 02:38:13 -0400
Received: from mga18.intel.com ([134.134.136.126]:55330 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231152AbhDNGiN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 14 Apr 2021 02:38:13 -0400
IronPort-SDR: 3c2+iVhxXLPV0MHA2u1lH5wHByBdu3X9aA4haDMC3mS4wMytS7IBbuebxqvMliu734Ih5gdvxw
 sRMQF/F0ktfw==
X-IronPort-AV: E=McAfee;i="6200,9189,9953"; a="182086416"
X-IronPort-AV: E=Sophos;i="5.82,221,1613462400"; 
   d="scan'208";a="182086416"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 23:37:51 -0700
IronPort-SDR: fP0TZKOO4Fj/Rl8WiI8Qg5sDhw72dITumDxNyo3sQZcqmcmmRy8v7RYT6iFWr8OXGOxZql0Sii
 ULLYFQe+lWHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,221,1613462400"; 
   d="scan'208";a="521885239"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 13 Apr 2021 23:37:49 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 14 Apr 2021 09:37:48 +0300
Date:   Wed, 14 Apr 2021 09:37:48 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [bug report] usb: typec: Port mapping utility
Message-ID: <YHaNvJwd8XXFWVap@kuha.fi.intel.com>
References: <YHXpocjNVY7MyXzJ@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHXpocjNVY7MyXzJ@mwanda>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 13, 2021 at 09:57:37PM +0300, Dan Carpenter wrote:
> Hello Heikki Krogerus,
> 
> The patch ae196ddb0d31: "usb: typec: Port mapping utility" from Apr
> 7, 2021, leads to the following static checker warning:
> 
> 	drivers/usb/typec/port-mapper.c:168 typec_link_port()
> 	warn: missing error code 'ret'
> 
> drivers/usb/typec/port-mapper.c
>    156  int typec_link_port(struct device *port)
>    157  {
>    158          struct device *connector;
>    159          struct port_node *node;
>    160          int ret = 0;
>    161  
>    162          node = create_port_node(port);
>    163          if (IS_ERR(node))
>    164                  return PTR_ERR(node);
>    165  
>    166          connector = find_connector(node);
>    167          if (!connector)
>    168                  goto remove_node;
> 
> Set error code?

False positive in this case. Not an error.

thanks,

>    169  
>    170          ret = link_port(to_typec_port(connector), node);
>    171          if (ret)
>    172                  goto put_connector;
>    173  
>    174          return 0;
>    175  
>    176  put_connector:
>    177          put_device(connector);
>    178  remove_node:
>    179          remove_port_node(node);
>    180  
>    181          return ret;
>    182  }

-- 
heikki
