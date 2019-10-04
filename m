Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7C73CBEDE
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2019 17:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389754AbfJDPR0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Oct 2019 11:17:26 -0400
Received: from mga03.intel.com ([134.134.136.65]:26885 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389165AbfJDPR0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Oct 2019 11:17:26 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Oct 2019 08:17:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,256,1566889200"; 
   d="scan'208";a="205878604"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 04 Oct 2019 08:17:23 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 04 Oct 2019 18:17:22 +0300
Date:   Fri, 4 Oct 2019 18:17:22 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 3/7] usb: typec: Separate the operations vector
Message-ID: <20191004151722.GA14192@kuha.fi.intel.com>
References: <20191004150817.45413-1-heikki.krogerus@linux.intel.com>
 <20191004150817.45413-4-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191004150817.45413-4-heikki.krogerus@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 04, 2019 at 06:08:13PM +0300, Heikki Krogerus wrote:
> @@ -1103,7 +1113,8 @@ port_type_store(struct device *dev, struct device_attribute *attr,
>  	int ret;
>  	enum typec_port_type type;
>  
> -	if (!port->cap->port_type_set || port->cap->type != TYPEC_PORT_DRP) {
> +	if (port->cap->type != TYPEC_PORT_DRP || !port->cap->port_type_set ||
> +	    (!port->ops && !port->ops->port_type_set)) {

This is still broken :-/

-- 
heikki
